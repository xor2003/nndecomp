void _win8();
void _latlon();
void _draw_grid(int, int);

void _win8()
{
	struct dosdate_t d;
	_dos_getdate(&d);
	char month[10], mon[10], day[4], year[6];

	switch (d.month)
	{
	case 1:
		strcpy(month, "January");
		break;
	case 2:
		strcpy(month, "February");
		break;
	case 3:
		strcpy(month, "March");
		break;
	case 4:
		strcpy(month, "April");
		break;
	case 5:
		strcpy(month, "May");
		break;
	case 6:
		strcpy(month, "June");
		break;
	case 7:
		strcpy(month, "July");
		break;
	case 8:
		strcpy(month, "August");
		break;
	case 9:
		strcpy(month, "Sptember");
		break;
	case 10:
		strcpy(month, "October");
		break;
	case 11:
		strcpy(month, "November");
		break;
	case 12:
		strcpy(month, "December");
		break;
	}

	strcpy(mon, " , ");
	strcat(mon, month);
	itoa(d.year, year, 10);
	itoa(d.day, day, 10);

	int x = 10, y = getmaxy() - 20;
	outtextxy(x, y, year);
	outtextxy(x + 25, y, mon);
	outtextxy(x + 110, y, day);
	getch();
}
