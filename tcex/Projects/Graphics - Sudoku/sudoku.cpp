#include "spellcount.cpp"

struct dimensions
{
	int l, b;
} box[9][9];

void main()
{
	int gd = 0, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");
	int sum[9][9];
	setfillstyle(WIDE_DOT_FILL, 7);
	bar(0, 0, 100, 20);
	outtextxy(10, 10, "Exit game!");
	int lbox = 20, bbox = 20;
	setlinestyle(0, 0, 3);
	rectangle(getmaxx() / 2 - (lbox * 9 / 2), getmaxy() / 2 - (bbox * 9 / 2),
			  getmaxx() / 2 + (lbox * 9 / 2), getmaxy() / 2 + (bbox * 9 / 2));
	for (int i = 0; i < 9; i++)
	{
		int inx = getmaxx() / 2 - (lbox * 9 / 2) + (lbox / 2), iny = getmaxy() / 2 - (bbox * 9 / 2) + (bbox / 2);
		for (int j = 0; j < 9; j++)
		{
			box[i][j].l = inx;
			inx += lbox;
			box[j][i].b = iny;
			iny += bbox;
		}
	} //values for checking

	int l = getmaxx() / 2 - (lbox * 9 / 2);
	int b = getmaxy() / 2 - (bbox * 9 / 2);
	for (i = 1; i <= 9; i++)
	{
		if (i % 3 == 0)
			setlinestyle(0, 0, 3);
		else
			setlinestyle(0, 0, 0);
		l += lbox;
		b += bbox;
		line(l, getmaxy() / 2 - (bbox * 9 / 2), l,
			 getmaxy() / 2 + (bbox * 9 / 2));
		line(getmaxx() / 2 - (lbox * 9 / 2), b, getmaxx() / 2 + (lbox * 9 / 2),
			 b);
	} // lines of box (grids)
	int ch;
	while (ch != 27)
	{
		showmouseptr();
		getmousepos(&x, &y, &button);
		if (button == 1)
		{
			/*if(x>0&&x<100&&y>0&&y<20)
			 {
			 break;// or exit(0);
			 } // button for exiting before gameover but not working
			 */
			for (i = 0; i < 9; i++)
			{
				for (int j = 0; j < 9; j++)
				{
					if (x > box[i][j].l - (lbox / 2) && y > box[i][j].b - (bbox / 2) && x < box[i][j].l + (lbox / 2) && y < box[i][j].b + (bbox / 2))
					{ //to check in which block the mouse has been clicked
						ch = getch();
						sum[i][j] = ch; // no. which has been entered
						switch (ch)
						{
						case 1:
							one(box[i][j].l, box[i][j].b, 10);
							break;
						case 2:
							two(box[i][j].l, box[i][j].b, 10);
							break;
						case 3:
							three(box[i][j].l, box[i][j].b, 10);
							break;
						case 4:
							four(box[i][j].l, box[i][j].b, 10);
							break;
						case 5:
							five(box[i][j].l, box[i][j].b, 10);
							break;
						case 6:
							six(box[i][j].l, box[i][j].b, 10);
							break;
						case 7:
							seven(box[i][j].l, box[i][j].b, 10);
							break;
						case 8:
							eight(box[i][j].l, box[i][j].b, 10);
							break;
						case 9:
							nine(box[i][j].l, box[i][j].b, 10);
							break;
						}
					}
				}
			}
		}
		ch = getch(); // confusion where to put this?
		int s, right = 0;
		if (ch == 13)
		{
			//s=0;
			for (int g = 0; g < 9; g++)
			{
				s = 0;
				for (int h = 0; h < 9; h++)
				{
					s = s + sum[g][h];
				} // sum horizontally
				if (s == 45)
				{
					right++;
				}
			}
			for (g = 0; g < 9; g++)
			{
				s = 0;
				for (int h = 0; h < 9; h++)
				{
					s = s + sum[h][g];
				} // sum vertically
				if (s == 45)
				{
					right++;
				}
			}
			// sum of each big block
			if ((sum[0][0] + sum[0][1] + sum[0][2] + sum[1][0] + sum[1][1] + sum[1][2] + sum[2][0] + sum[2][1] + sum[2][2]) == 45)
			{
				right++;
			}
			if ((sum[3][0] + sum[3][1] + sum[3][2] + sum[4][0] + sum[4][1] + sum[4][2] + sum[5][0] + sum[5][1] + sum[5][2]) == 45)
			{
				right++;
			}
			if ((sum[6][0] + sum[6][1] + sum[6][2] + sum[7][0] + sum[7][1] + sum[7][2] + sum[8][0] + sum[8][1] + sum[8][2]) == 45)
			{
				right++;
			}
			if (right == 27)
			{
				cleardevice();
				outtextxy(getmaxx() / 2 - 20, getmaxy() / 2, "YOU WIN!");
			}
		}
	}
	//	getch();
}
