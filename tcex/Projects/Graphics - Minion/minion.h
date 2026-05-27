#ifndef MINION_H_
#define MINION_H_

void _minion_draw(int, int, float);

void _minion_draw(int x, int y, float size)
{
	y += size / 200;
	int col = getcolor();

	//head
	setcolor(YELLOW);
	circle(x, y - size / 4, size / 10);
	setfillstyle(SOLID_FILL, YELLOW);
	floodfill(x, y - size / 4, YELLOW);

	//body
	setfillstyle(SOLID_FILL, YELLOW);
	bar(x - size / 10, y - size / 4, x + size / 10, y + size / 5);
	ellipse(x, y - size / 80, 235, 305, 7 * size / 40, size / 4);
	floodfill(x, y + size / 5, YELLOW);

	//eyes
	setcolor(0);
	circle(x, y - size / 5, size / 100);
	setfillstyle(SOLID_FILL, 0);
	floodfill(x, y - size / 5, 0);

	setcolor(LIGHTBLUE);
	circle(x, y - size / 5, size / 40);
	circle(x, y - size / 5, 3 * size / 80);
	setfillstyle(SOLID_FILL, LIGHTBLUE);
	floodfill(x + 3 * size / 100, y - size / 5, LIGHTBLUE);
	setcolor(LIGHTBLUE);
	ellipse(x, y - 89 * size / 400, 225, 255, 3 * size / 20, size / 40);
	ellipse(x, y - 9 * size / 40, 225, 255, 3 * size / 20, size / 40);
	ellipse(x, y - 91 * size / 400, 225, 255, 3 * size / 20, size / 40);
	ellipse(x, y - 89 * size / 400, 285, 315, 3 * size / 20, size / 40);
	ellipse(x, y - 9 * size / 40, 285, 315, 3 * size / 20, size / 40);
	ellipse(x, y - 91 * size / 400, 285, 315, 3 * size / 20, size / 40);

	//smile
	setcolor(0);
	ellipse(x - size / 80, y - 3 * size / 16, 265, 325, size / 16,
			3 * size / 40);

	//hands
	setcolor(YELLOW);
	ellipse(x, y + size / 16, 0, 360, 9 * size / 80, size / 10);
	ellipse(x, y + size / 16, 0, 360, 23 * size / 200, 41 * size / 400);
	ellipse(x, y + size / 16, 0, 360, 47 * size / 400, 21 * size / 200);

	//clothes
	setcolor(BLUE);
	ellipse(x, y - size / 20, 225, 315, 3 * size / 20, 3 * size / 80);
	ellipse(x, y - 3 * size / 80, 225, 315, 3 * size / 20, 3 * size / 80);
	line(x - size / 10, y - size / 40, x - size / 10, y);
	line(x + size / 10, y - size / 40, x + size / 10, y);
	setfillstyle(SOLID_FILL, BLUE);
	floodfill(x, y - size / 400, BLUE);
	ellipse(x, y + size / 20, 225, 315, 3 * size / 20, size / 20);
	line(x - size / 10, y + 3 * size / 40, x - size / 10, y + size / 5);
	line(x + size / 10, y + 3 * size / 40, x + size / 10, y + size / 5);
	ellipse(x, y - size / 80, 235, 305, 7 * size / 40, size / 4);
	floodfill(x, y + size / 8, BLUE);
	rectangle(x - 3 * size / 40, y - size / 80, x + 3 * size / 40,
			  y + size / 10); // design here
	setcolor(BLUE);
	circle(x, y + size / 20, 3 * size / 80); //design
	floodfill(x - size / 20, y + size / 40, BLUE);

	//skates
	/*	setcolor(BLUE);
	 ellipse(x,y+85,180,360,85,15);
	 ellipse(x,y+90,180,360,80,20);
	 setfillstyle(SOLID_FILL,BLUE);
	 floodfill(x,y+102,BLUE);
	 */
	setcolor(col);
}

#endif
