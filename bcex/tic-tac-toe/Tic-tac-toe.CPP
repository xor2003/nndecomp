#include <process.h>
#include <string.h>
#include <dos.h>
#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <iostream.h>
#include <math.h>

union REGS in,out;

const enum __MOUSE__CLICK_AND_OTHER_DECLARATION
{
INIT    = 0,	SHOW    = 1,
HIDE    = 2,	POSI    = 3,
MOVE    = 4,

L_MOUSE   = 1,	R_MOUSE   = 2,	M_MOUSE   = 4,
L_R_MOUSE = 3,	R_L_MOUSE = 3,	M_L_MOUSE = 5,	L_M_MOUSE = 5,
R_M_MOUSE = 6,	M_R_MOUSE = 6,	ALL_MOUSE = 7,	NON_MOUSE = 0
};

int  initmouse(void);
void showmouse(void);
void hidemouse(void);
void mouseposition(int&,int&,int&);
void movemouse(int,int);
int  startmouse();
void mouse_delay(int&,int&,int&);

void mouse_delay(int &b,int &x,int &y)
{
do
{
mouseposition(b,x,y);
}while(b == 1);
}

int initmouse()
{
in.x.ax = INIT;
int86(0x33,&in,&out);
return(in.x.ax);
}

void showmouse()
{
in.x.ax = SHOW;
int86(0x33,&in,&out);
}

void hidemouse()
{
in.x.ax = HIDE;
int86(0x33,&in,&out);
}

void mouseposition(int& button,int& x, int& y)
{
in.x.ax = POSI;
int86(0x33,&in,&out);
x = out.x.cx;
y = out.x.dx;
button = out.x.bx;
showmouse();
}

void movemouse(int x,int y)
{
in.x.ax = MOVE;
in.x.cx = x;
in.x.dx = y;
int86(0x33,&in,&out);
showmouse();
}

int startmouse()
{
if(initmouse())
return(in.x.ax);
showmouse();
in.x.bx = -1;
return(1);
}


enum   X_O
{
	EMPTY  =  0,
	X      =  1,    O      = 2
}BOX;

class  __GAME__X_O__
{
		public:
	int   A1,  A2,  A3,  B1,  B2,  B3,  C1,  C2,  C3;
	int   A1x, A2x, A3x, B1x, B2x, B3x, C1x, C2x, C3x;
	int   A1y, A2y, A3y, B1y, B2y, B3y, C1y, C2y, C3y;
	int   _player,  _computer;
	char  name[];
	int   win, lose, tie;
		public:
void initialize()
{
	strcpy(name,"");
	fflush(stdin);	fflush(stdout);
	clrscr();
	A1=A2=A3=B1=B2=B3=C1=C2=C3=EMPTY;
		A1x = A2x = A3x = 14;
		B1x = B2x = B3x = 40;
		C1x = C2x = C3x = 66;

		A1y = B1y = C1y = 5 ;
		A2y = B2y = C2y = 13;
		A3y = B3y = C3y = 21;
}

void if_registration()
{
	if(!strcmp(name,"")
	{
	cout<<"Enter your name : ";
	scanf("%[^\n]",&name);
	}
	int gdriver = DETECT,gmode;
	initgraph(&gdriver,&gmode,"");    // Replace "" with your graphics driver location
	clrscr();     cleardevice();
	settextstyle(TRIPLEX_FONT,0,2);
	setbkcolor(BLACK);
	setcolor(YELLOW);
	char msg[100];
	strcpy(msg,"Select your turn, ");
	strcat(msg,name);
	outtextxy(1,1,msg);
	startmouse();
	setfillstyle(SOLID_FILL, WHITE);
	setcolor(BLACK);
	bar(0,30,20,50);	outtextxy(5,25,"X");
	bar(25,30,110,50);	outtextxy(30,25,"RANDOM");
	bar(115,30,135,50);	outtextxy(120,25,"O");
	int  MOUSE_X, MOUSE_Y, MOUSE_B;
	while(1)
	{
		loop:
		mouseposition(MOUSE_B, MOUSE_X, MOUSE_Y);
		if(MOUSE_B==1)
		{
			mouse_delay(MOUSE_B,MOUSE_X,MOUSE_Y);
		if((MOUSE_X>=0)&&(MOUSE_X<=20)&&(MOUSE_Y>=30)&&(MOUSE_Y<=50))
			{
				_player   = X;
				_computer = O;
			}
		else if((MOUSE_X>=25)&&(MOUSE_X<=110)&&(MOUSE_Y>=30)&&(MOUSE_Y<=50))
			{
				randomize();
				_player   = ((random(100)%2)+1);
				if(_player==X)
					_computer = O;
				else
					_computer = X;
			}
		else if((MOUSE_X>=115)&&(MOUSE_X<=135)&&(MOUSE_Y>=30)&&(MOUSE_Y<=50))
			{
				_player   = O;
				_computer = X;
			}
		else goto loop;
		break;
		}
	}
	hidemouse();
}

void print_X(int x,int y)
{
	gotoxy(x,y);         cout<<"*";
	gotoxy(x-1,y-1);     cout<<"*";
	gotoxy(x-1,y+1);     cout<<"*";
	gotoxy(x-2,y-2);     cout<<"*";
	gotoxy(x-2,y+2);     cout<<"*";
	gotoxy(x-3,y-3);     cout<<"*";
	gotoxy(x-3,y+3);     cout<<"*";
	gotoxy(x+1,y-1);     cout<<"*";
	gotoxy(x+1,y+1);     cout<<"*";
	gotoxy(x+2,y-2);     cout<<"*";
	gotoxy(x+2,y+2);     cout<<"*";
	gotoxy(x+3,y-3);     cout<<"*";
	gotoxy(x+3,y+3);     cout<<"*";
}

void print_O(int x,int y)
{
	gotoxy(x-3,y-3);     cout<<"*******";
	gotoxy(x-3,y-2);     cout<<"**    *";
	gotoxy(x-3,y-1);     cout<<"* *   *";
	gotoxy(x-3,y+0);     cout<<"*  *  *";
	gotoxy(x-3,y+1);     cout<<"*   * *";
	gotoxy(x-3,y+2);     cout<<"*    **";
	gotoxy(x-3,y+3);     cout<<"*******";
}

int print_on_map(char box[2],int inp)
{
	//hidemouse();
	if((inp<1)||(inp>2))
		return(-1);
	if(!strcmp(box,"A1"))
	{
		A1 = inp;
		if(inp == X)
			print_X(A1x,A1y);
		else
			print_O(A1x,A1y);
		return(1);
	}
	if(!strcmp(box,"B1"))
	{
		B1 = inp;
		if(inp == X)
			print_X(B1x,B1y);
		else
			print_O(B1x,B1y);
		return(1);
	}
	if(!strcmp(box,"C1"))
	{
		C1 = inp;
		if(inp == X)
			print_X(C1x,C1y);
		else
			print_O(C1x,C1y);
		return(1);
	}
	if(!strcmp(box,"A2"))
	{
		A2 = inp;
		if(inp == X)
			print_X(A2x,A2y);
		else
			print_O(A2x,A2y);
		return(1);
	}
	if(!strcmp(box,"B2"))
	{
		B2 = inp;
		if(inp == X)
			print_X(B2x,B2y);
		else
			print_O(B2x,B2y);
		return(1);
	}
	if(!strcmp(box,"C2"))
	{
		C2 = inp;
		if(inp == X)
			print_X(C2x,C2y);
		else
			print_O(C2x,C2y);
		return(1);
	}
	if(!strcmp(box,"A3"))
	{
		A3 = inp;
		if(inp == X)
			print_X(A3x,A3y);
		else
			print_O(A3x,A3y);
		return(1);
	}
	if(!strcmp(box,"B3"))
	{
		B3 = inp;
		if(inp == X)
			print_X(B3x,B3y);
		else
			print_O(B3x,B3y);
		return(1);
	}
	if(!strcmp(box,"C3"))
	{
		C3 = inp;
		if(inp == X)
			print_X(C3x,C3y);
		else
			print_O(C3x,C3y);
		return(1);
	}
	return(0);
}

void print_map()
{
	fflush(stdin);    fflush(stdout);
	clrscr();
	//    0         1         2         3         4         5         6         7         8       //
	//    *         *         *         *         *         *         *         *         *       //___0
	cout<<"###############################################################################"<<endl //```1
	    <<"#                         |                         |                         #"<<endl //   2 <<
	    <<"#                         |                         |                         #"<<endl //   3   <<
	    <<"#                         |                         |                         #"<<endl //   4     <<
	    <<"#                         |                         |                         #"<<endl //   5       << 7
	    <<"#                         |                         |                         #"<<endl //   6     <<
	    <<"#                         |                         |                         #"<<endl //   7   <<
	    <<"#                         |                         |                         #"<<endl //   8 <<
	    <<"#-------------------------+-------------------------+-------------------------#"<<endl //   9
	    <<"#                         |                         |                         #"<<endl //  10
	    <<"#                         |                         |                         #"<<endl //  11
	    <<"#                         |                         |                         #"<<endl //  12
	    <<"#                         |                         |                         #"<<endl //  13
	    <<"#                         |                         |                         #"<<endl //  14
	    <<"#                         |                         |                         #"<<endl //  15
	    <<"#                         |                         |                         #"<<endl //  16
	    <<"#-------------------------+-------------------------+-------------------------#"<<endl //  17
	    <<"#                         |                         |                         #"<<endl //  18
	    <<"#                         |                         |                         #"<<endl //  19
	    <<"#                         |                         |                         #"<<endl //  20
	    <<"#                         |                         |                         #"<<endl //  21
	    <<"#                         |                         |                         #"<<endl //  22
	    <<"#                         |                         |                         #"<<endl //  23
	    <<"#                         |                         |                         #"<<endl //  24
	    <<"###############################################################################";      //  25
}

int check_result()
{
	if((A1 == X)&&(A2 == X)&&(A3 == X))
		return X;
	if((A1 == O)&&(A2 == O)&&(A3 == O))
		return O;
	if((B1 == X)&&(B2 == X)&&(B3 == X))
		return X;
	if((B1 == O)&&(B2 == O)&&(B3 == O))
		return O;
	if((C1 == X)&&(C2 == X)&&(C3 == X))
		return X;
	if((C1 == O)&&(C2 == O)&&(C3 == O))
		return O;
	if((A1 == X)&&(B1 == X)&&(C1 == X))
		return X;
	if((A1 == O)&&(B1 == O)&&(C1 == O))
		return O;
	if((A2 == X)&&(B2 == X)&&(C2 == X))
		return X;
	if((A2 == O)&&(B2 == O)&&(C2 == O))
		return O;
	if((A3 == X)&&(B3 == X)&&(C3 == X))
		return X;
	if((A3 == O)&&(B3 == O)&&(C3 == O))
		return O;
	if((A1 == X)&&(B2 == X)&&(C3 == X))
		return X;
	if((A1 == O)&&(B2 == O)&&(C3 == O))
		return O;
	if((C1 == X)&&(B2 == X)&&(A3 == X))
		return X;
	if((C1 == O)&&(B2 == O)&&(A3 == O))
		return O;
	if((A1 != 0)&&(B1 != 0)&&(C1 != 0)&&(A2 != 0)&&(B2 != 0)&&(C2 != 0)&&(A3 != 0)&&(B3 != 3)&&(C3 != 0))
		return 3;
	return 0;
}

void play_computer()
{
int x,*box[9];
box[0] = &A1;	box[1] = &A2;	box[2] = &A3;
box[3] = &B1;	box[4] = &B2;	box[5] = &B3;
box[6] = &C1;	box[7] = &C2;	box[8] = &C3;
if(!check_result())
do
{
x = (rand()%9);
}while((*box[x]) != EMPTY);
(*box[x]) = _computer;
}


};


void main()
{
int MOUSE_B,MOUSE_X,MOUSE_Y,x=0;
clrscr();
textbackground(BLACK);
textcolor(WHITE);
__GAME__X_O__ game;
game.win = game.lose = game.tie = 0;
clrscr();
closegraph();
game.win=game.lose=game.tie=0;
play_again:
game.initialize();
game.if_registration();
game.print_map();
startmouse();
delay(300);
_setcursortype(_NOCURSOR);
if(game._computer == X)
{
	game.play_computer();
	game.print_on_map("A1",game.A1);
	game.print_on_map("B1",game.B1);
	game.print_on_map("C1",game.C1);
	game.print_on_map("A2",game.A2);
	game.print_on_map("B2",game.B2);
	game.print_on_map("C2",game.C2);
	game.print_on_map("A3",game.A3);
	game.print_on_map("B3",game.B3);
	game.print_on_map("C3",game.C3);
}
while(!game.check_result())
{
	showmouse();
	mouseposition(MOUSE_B,MOUSE_X,MOUSE_Y);
	if(MOUSE_B==1)
	{
		x=1;
		mouse_delay(MOUSE_B,MOUSE_X,MOUSE_Y);
		hidemouse();
	     if((MOUSE_X>=000.000)&&(MOUSE_X<=213.333)&&(MOUSE_Y>=000.000)&&(MOUSE_Y<=072.000))
	     {
		if(game.A1 == 0)
			game.print_on_map("A1",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=213.333)&&(MOUSE_X<=426.666)&&(MOUSE_Y>=000.000)&&(MOUSE_Y<=072.000))
	     {
		if(game.B1 == 0)
			game.print_on_map("B1",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=426.666)&&(MOUSE_X<=640.000)&&(MOUSE_Y>=000.000)&&(MOUSE_Y<=072.000))
	     {
		if(game.C1 == 0)
			game.print_on_map("C1",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=000.000)&&(MOUSE_X<=213.333)&&(MOUSE_Y>=072.000)&&(MOUSE_Y<=136.000))
	     {
		if(game.A2 == 0)
			game.print_on_map("A2",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=213.333)&&(MOUSE_X<=426.666)&&(MOUSE_Y>=072.000)&&(MOUSE_Y<=136.000))
	     {
		if(game.B2 == 0)
			game.print_on_map("B2",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=426.666)&&(MOUSE_X<=640.000)&&(MOUSE_Y>=072.000)&&(MOUSE_Y<=136.000))
	     {
		if(game.C2 == 0)
			game.print_on_map("C2",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=000.000)&&(MOUSE_X<=213.333)&&(MOUSE_Y>=136.000)&&(MOUSE_Y<=240.000))
	     {
		if(game.A3 == 0)
			game.print_on_map("A3",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=213.333)&&(MOUSE_X<=426.666)&&(MOUSE_Y>=136.000)&&(MOUSE_Y<=240.000))
	     {
		if(game.B3 == 0)
			game.print_on_map("B3",game._player);
		else x=0;
	     }
	else if((MOUSE_X>=426.666)&&(MOUSE_X<=640.000)&&(MOUSE_Y>=136.000)&&(MOUSE_Y<=240.000))
	     {
		if(game.C3 == 0)
			game.print_on_map("C3",game._player);
		else x=0;
	     }
	}
	else x=0;
	if((x==1)&&(!game.check_result()))
	{
		game.play_computer();
		game.print_on_map("A1",game.A1);
		game.print_on_map("B1",game.B1);
		game.print_on_map("C1",game.C1);
		game.print_on_map("A2",game.A2);
		game.print_on_map("B2",game.B2);
		game.print_on_map("C2",game.C2);
		game.print_on_map("A3",game.A3);
		game.print_on_map("B3",game.B3);
		game.print_on_map("C3",game.C3);
	}
}

getch();
clrscr();
if(game.check_result() == game._player)
{
	cout<<"Congrations, You won the match against computer";
	game.win++;
}
else if(game.check_result() == game._computer)
{
	cout<<"Sorry, You lose";
	game.lose++;
}
else
{
	cout<<"Oh! It was a Tie";
	game.tie++;
}
cout<<endl
    <<"Total match played :  "<<(game.win + game.lose + game.tie)<<endl<<endl
    <<"Total win  :  "<<(game.win )/*<<",\tWin percent :  "<<((float)(game.win  / (game.win + game.lose + game.tie)))*/<<endl
    <<"Total lose :  "<<(game.lose)/*<<",\tLose percent:  "<<((float)(game.lose / (game.win + game.lose + game.tie)))*/<<endl
    <<"Total tie  :  "<<(game.tie )/*<<",\tTie percent :  "<<((float)(game.tie  / (game.win + game.lose + game.tie)))*/<<endl<<endl<<endl
    <<"Press 'Y' to play again"<<endl;
char a = getch();
if((a == 'y')||(a == 'Y'))
	goto play_again;
cout<<"We will be happy to see you again";
_setcursortype(_NORMALCURSOR);
getch();
}
