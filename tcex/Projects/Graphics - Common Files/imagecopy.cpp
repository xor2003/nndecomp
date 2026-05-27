#include "conio.h"
#include "gourav.h"

int main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");

	getch();
	setfillstyle(1, 10);
	bar(10, 10, 20, 20);
	getch();

	long size = imagesize(10, 10, 20, 20);
	void far
		*buff = farmalloc(size);

	getimage(10, 10, 20, 20, buff);
	getch();
	putimage(100, 100, buff, COPY_PUT);

	getch();
	return 0;
}
