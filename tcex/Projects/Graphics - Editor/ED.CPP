#include "gourav.h"

void front();

void front()
{
	/*	setcolor(4);
	 rectangle(2,2,getmaxx()-2,getmaxy()-2);

	 setfillstyle(SOLID_FILL,DARKGRAY);
	 bar(2,getmaxy()-20,getmaxx()-2,getmaxy()-2);

	 setfillstyle(SOLID_FILL,BLUE);
	 bar(getmaxx()-10,20,getmaxx()-2,getmaxy()-2);
	 */
	setfillstyle(SOLID_FILL, WHITE);
	bar(3, 20, getmaxx() - 3, getmaxy() - 20);
}

char dir[50];
int x = 4, y = 25;

struct mline
{
	char text[82];
	int num;
	int pos;
};

void writefile()
{
	char name[20];
	//	cout<<"Enter File Name\t";
	//	cin>>name;
	//	strcpy(dir,"c:\\");	strcat(dir,name);
	//	strcat(dir,".txt");

	ofstream ofile("c:\\abcd.txt");

	char ch;
	//	char line[82];
	mline line;
	line.pos = 0;

	setcolor(RED);

	while (1)
	{
		ch = getch(); /*
		 if(ch==8)
		 {
		 int color=getcolor();
		 setcolor(WHITE);
		 outtextxy(x,y,line.text);

		 line.text[--line.pos]='\0';

		 setcolor(color);
		 outtextxy(x,y,line.text);
		 }
		 else */
		if (ch == 27)
		{
			line.text[line.pos] = '\0';
			ofile << line.text;
			break;
		}
		else if (ch == 13 || line.pos == 79)
		{
			line.text[line.pos] = ch;
			line.text[++line.pos] = '\0';
			line.pos = 0;
			line.num++;
			y += 10;
			ofile << line.text << endl;
		}
		else
		{
			//	setcolor(WHITE);
			//	outtextxy(x,y,line.text);

			setcolor(RED);
			line.text[line.pos] = ch;
			line.text[++line.pos] = '\0';
			outtextxy(x, y, line.text);
		}
	}

	ofile.close();
}

void readfile()
{
	ifstream ifile("c:\\abcd.txt");
	char ch;

	while (1)
	{
		ifile.get(ch);
		if (ifile.eof())
			break;
		cout << ch;
	}

	ifile.close();
}

void main()
{
	clrscr();

	_graphics_init();

	front();

	writefile();
	getch();
	cout << "\n\n";
	readfile();

	getch();
	closegraph();
}
