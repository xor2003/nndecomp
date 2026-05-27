/*
 * ConceptOS.h
 * Author : Gourav Siddhad
 */
void owindow()
{
	bar(120, 65, getmaxx() - 120, getmaxy() - 65);

	int left = 120, top = 65, right = getmaxx() - 120, bot = getmaxy() - 65;
	setlinestyle(0, 0, 3);

	setcolor(15);

	for (int k = 0; k < 40; k++)
	{
		rectangle(left, top, right, bot);

		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;

		delay(4);
	}

	left = 70;
	top = 10;
	right = 70;
	bot = getmaxy() - 10;

	setfillstyle(SOLID_FILL, 15);
	bar(left, top, right, bot);

	bar(70, 10, 95, 25);
	bar(70, getmaxy() - 10, 95, getmaxy() - 25);

	bar(getmaxx() - 95, 10, getmaxx() - 70, 25);
	bar(getmaxx() - 95, getmaxy() - 10, getmaxx() - 70, getmaxy() - 25);

	for (k = 70; k >= 10; k--)
	{
		setcolor(0);
		line(left + 10, top + 15, right + 10, bot - 15);
		line(getmaxx() - left - 10, top + 15, getmaxx() - right - 10, bot - 15);

		setcolor(1);
		bar(left, top, right, bot);
		bar(getmaxx() - left - 10, top, getmaxx() - right, bot);

		left -= 1;
		right -= 1;

		delay(2);
	}

	int d = getmaxy() / 6;

	setcolor(BLUE);
	ahome(50, d, 50);
	setcolor(BLUE);
	asuser(50, 2 * d);
	setcolor(BLUE);
	ainfo(50, 3 * d, 70);
	setcolor(BLUE);
	aclose(50, 4 * d, 50);
	setcolor(BLUE);
	amin(50, 5 * d, 100);
}

void cwindow()
{
	setcolor(0);
	setlinestyle(0, 0, 3);

	for (int k = 0; k < getmaxx() / 2; k++)
	{
		line(k, 0, k, getmaxy());
		line(getmaxx() - k, 0, getmaxx() - k, getmaxy());
	}
}

void wwindow()
{
	int d = getmaxy() / 6;
	int flag = 0, dis = 0, dd = 0;
	char str1[10], str2[10];
	strcpy(str1, "");
	strcpy(str2, "");

	while (!kbhit())
	{
		getmousepos(&button, &mx, &my);
		flag = 0;

		dis = sqrt(pow((50 - mx), 2) + pow((d - my), 2));
		if (dis <= 20)
		{
			flag = 1;
			setcolor(RED);
			strcpy(str2, str1);
			strcpy(str1, "HOME");
			outtextxy(getmaxx() / 2 - 15, getmaxy() - 10, str1);
		}

		dis = sqrt(pow((50 - 2 - mx), 2) + pow((2 * d - my), 2));
		if (dis <= 20)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "SWITCH USER");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 45, getmaxy() - 10, str1);
		}

		dis = sqrt(pow((50 - 2 - mx), 2) + pow((3 * d - my), 2));
		if (dis <= 20)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "INFO");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 15, getmaxy() - 10, str1);
		}

		dis = sqrt(pow((50 - mx), 2) + pow((4 * d - my), 2));
		if (dis <= 20)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "CLOSE");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 20, getmaxy() - 10, str1);
		}

		dis = sqrt(pow((50 - mx), 2) + pow((5 * d - my), 2));
		if (dis <= 20)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "MINIMISE");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 30, getmaxy() - 10, str1);
		}

		if (button == 1)
		{
			dis = sqrt(pow((50 - mx), 2) + pow((d - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}

			dis = sqrt(pow((50 - mx), 2) + pow((2 * d - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}

			dis = sqrt(pow((50 - mx), 2) + pow((3 * d - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}

			dis = sqrt(pow((50 - mx), 2) + pow((4 * d - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}

			dis = sqrt(pow((50 - mx), 2) + pow((5 * d - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}
		}

		if (strcmp(str1, str2) != 0 || flag == 0)
		{
			if (strcmp(str2, "HOME") == 0)
				dd = 15;
			if (strcmp(str2, "SWITCH USER") == 0)
				dd = 45;
			if (strcmp(str2, "INFO") == 0)
				dd = 15;
			if (strcmp(str2, "CLOSE") == 0)
				dd = 20;
			if (strcmp(str2, "MINIMISE") == 0)
				dd = 30;
			setcolor(0);
			outtextxy(getmaxx() / 2 - dd, getmaxy() - 10, str2);
		}
	}
}

void aloading()
{
	setfillstyle(SOLID_FILL, BLUE);
	bar(40, getmaxy() - 42, getmaxx() - 40, getmaxy() - 40);

	for (int j = 41; j < getmaxx() - 40; j++)
	{
		delay(2);
		putpixel(j, getmaxy() - 41, RED);
	}
}

void akeypad(int x1, int y1)
{
	int l1 = 100;
	y1 -= l1 / 3 + l1 / 15;

	settextstyle(GOTHIC_FONT, HORIZ_DIR, 5);
	hidemouseptr();

	setcolor(RED);

	circle(x1 - l1 / 2 - l1 / 4, y1, l1 / 4); //4
	circle(x1, y1, l1 / 4);					  //5
	circle(x1 + l1 / 2 + l1 / 4, y1, l1 / 4); //6

	circle(x1 - l1 / 2 - l1 / 4, y1 - l1 / 2 - l1 / 4, l1 / 4); //1
	circle(x1, y1 - l1 / 2 - l1 / 4, l1 / 4);					//2
	circle(x1 + l1 / 2 + l1 / 4, y1 - l1 / 2 - l1 / 4, l1 / 4); //3

	circle(x1 - l1 / 2 - l1 / 4, y1 + l1 / 2 + l1 / 4, l1 / 4); //7
	circle(x1, y1 + l1 / 2 + l1 / 4, l1 / 4);					//8
	circle(x1 + l1 / 2 + l1 / 4, y1 + l1 / 2 + l1 / 4, l1 / 4); //9

	circle(x1, y1 + l1 + l1 / 2, l1 / 4); //0

	outtextxy(x1 - l1 / 2 - l1 / 4 - l1 / 10, y1 - l1 / 2 - l1 / 2 - l1 / 20,
			  "1");
	outtextxy(x1 - l1 / 15, y1 - l1 / 2 - l1 / 2 - l1 / 20, "2");
	outtextxy(x1 + l1 / 2 + l1 / 4 - l1 / 15, y1 - l1 / 2 - l1 / 2 - l1 / 20,
			  "3");
	outtextxy(x1 - l1 / 2 - l1 / 3 - l1 / 30, y1 - l1 / 4 - l1 / 20, "4");
	outtextxy(x1 - l1 / 15, y1 - l1 / 4 - l1 / 20, "5");
	outtextxy(x1 + l1 / 2 + l1 / 4 - l1 / 15, y1 - l1 / 4 - l1 / 20, "6");
	outtextxy(x1 - l1 / 2 - l1 / 4 - l1 / 15, y1 + l1 / 2 - l1 / 20, "7");
	outtextxy(x1 - l1 / 15, y1 + l1 / 2 - l1 / 20, "8");
	outtextxy(x1 + l1 / 2 + l1 / 4 - l1 / 15, y1 + l1 / 2 - l1 / 20, "9");
	outtextxy(x1 - l1 / 15, y1 + l1 + l1 / 4 - l1 / 20, "0");

	setfillstyle(SOLID_FILL, 0);
	bar(x1 - 18, 25, x1 + 18, 45);
	setcolor(15);
	line(x1 - 20, 25, x1 + 20, 25);

	showmouseptr();
}

void wkeypad(int x1, int y1)
{
	int k = 0, x, y;
	char ch[] = {'\0', '\0', '\0', '\0', '\0'};
	int l1 = 100;
	y1 -= l1 / 3 + l1 / 15;

	settextstyle(DEFAULT_FONT, HORIZ_DIR, 1);
	while (k < 4)
	{
		ch[k++] = getch();

		switch (ch[k - 1])
		{
		case '1':
			x = x1 - l1 / 2 - l1 / 4;
			y = y1 - l1 / 2 - l1 / 4;
			break;
		case '2':
			x = x1;
			y = y1 - l1 / 2 - l1 / 4;
			break;
		case '3':
			x = x1 + l1 / 2 + l1 / 4;
			y = y1 - l1 / 2 - l1 / 4;
			break;
		case '4':
			x = x1 - l1 / 2 - l1 / 4;
			y = y1;
			break;
		case '5':
			x = x1;
			y = y1;
			break;
		case '6':
			x = x1 + l1 / 2 + l1 / 4;
			y = y1;
			break;
		case '7':
			x = x1 - l1 / 2 - l1 / 4;
			y = y1 + l1 / 2 + l1 / 4;
			break;
		case '8':
			x = x1;
			y = y1 + l1 / 2 + l1 / 4;
			break;
		case '9':
			x = x1 + l1 / 2 + l1 / 4;
			y = y1 + l1 / 2 + l1 / 4;
			break;
		case '0':
			x = x1;
			y = y1 + l1 + l1 / 2;
			break;
		}

		outtextxy(x1 - 15, 32, ch);
		setcolor(YELLOW);
		circle(x, y, 25);
	}
}

char *readstring(int x1, int y1, int size)
{
	hidemouseptr();
	setcolor(15);

	char *str;
	char ch;
	int z;
	str = new char[size];

	for (z = 0; z < size; z++)
		str[z] = '\0';

	z = 0;
	do
	{
		ch = getch();
		if (ch == 0)
			ch = getch();
		if (ch == 13)
			break;
		if (ch == 8)
		{
			setcolor(0);
			outtextxy(x1, y1, str);
			z--;
			str[z] = '\0';
			setcolor(15);
			outtextxy(x1, y1, str);
			z--;
		}
		if (isalnum(ch) || (ch == '.') || (ch == ':'))
		{
			str[z] = ch;
			outtextxy(x1, y1, str);
		}
		z++;
	} while (z <= size);

	showmouseptr();
	return str;
}

char *readpass(int x1, int y1, int size)
{
	hidemouseptr();

	setcolor(15);
	char *str, *pass;
	char ch;
	int z;
	str = new char[size];
	pass = new char[size];

	for (z = 0; z < size; z++)
	{
		str[z] = '\0';
		pass[z] = '\0';
	}

	z = 0;
	do
	{
		ch = getch();
		if (ch == 0)
			ch = getch();
		if (ch == 13)
			break;
		if (ch == 8)
		{
			setcolor(0);
			outtextxy(x1, y1, pass);
			z--;
			str[z] = '\0';
			pass[z] = '\0';

			setcolor(15);
			outtextxy(x1, y1, pass);
			z--;
		}
		if (isalnum(ch) || (ch == '.') || (ch == ':'))
		{
			str[z] = ch;
			pass[z] = ':';
			outtextxy(x1, y1, pass);
		}
		z++;
	} while (z <= size);
	showmouseptr();
	return str;
}

void alogin()
{
	hidemouseptr();
	cleardevice();

	setcolor(WHITE);
	char str[] = "CONCEPT_MINI_OS_CL6113";
	char st[22];
	int k, j;

	for (k = 0; str[k] != '\0'; k++)
	{
		st[k] = str[k];
		st[k + 1] = '\0';
		delay(100);
		outtextxy(230, getmaxy() - 20, st);
	}

	for (k = 1, j = 42; k < 42; k++, j--)
	{
		setcolor(0);
		ausera(100 - j - 1, 100 - j - 1, k - 1);
		auserg(540 + j + 1, 100 - j - 1, k - 1);
		if (k >= 10)
		{
			ashutd(100 - j - 1, getmaxy() - 60 + j + 1, k - 1);
			aexit(getmaxx() - 100 + j + 1, getmaxy() - 60 + j + 1, k - 1);
		}

		setcolor(YELLOW);
		ausera(100 - j, 100 - j, k);
		auserg(540 + j, 100 - j, k);

		if (k >= 10)
		{
			setcolor(RED);
			ashutd(100 - j, getmaxy() - 60 + j, k);
			aexit(getmaxx() - 100 + j, getmaxy() - 60 + j, k);
		}
		delay(10);
	}
	rectangle(getmaxx() / 2 - 90, getmaxy() / 2 + 160, getmaxx() / 2 + 90,
			  getmaxy() / 2 + 180);
	showmouseptr();
}

void wlogin()
{
	char str1[20], str2[20];
	char *string;
	int flag = 0, d = 0, dis = 0;

	while (!kbhit())
	{
		getmousepos(&button, &mx, &my);
		flag = 0;

		dis = sqrt(pow((540 + 2 - mx), 2) + pow((100 - my), 2));
		if (dis <= 30)
		{
			flag = 1;
			setcolor(RED);
			strcpy(str2, str1);
			strcpy(str1, "GUEST");
			outtextxy(getmaxx() / 2 - 20, getmaxy() / 2 + 140, str1);
		}

		dis = sqrt(pow((100 - 2 - mx), 2) + pow((100 - my), 2));
		if (dis <= 30)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "ADMINISTRATOR");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 50, getmaxy() / 2 + 140, str1);
		}

		dis = sqrt(pow((100 - 2 - mx), 2) + pow((getmaxy() - 60 + 2 - my), 2));
		if (dis <= 25)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "SHUT DOWN");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 36, getmaxy() / 2 + 140, str1);
		}

		dis = sqrt(
			pow((getmaxx() - 100 + 2 - mx), 2) + pow((getmaxy() - 60 + 2 - my), 2));
		if (dis <= 25)
		{
			flag = 1;
			strcpy(str2, str1);
			strcpy(str1, "EXIT");
			setcolor(RED);
			outtextxy(getmaxx() / 2 - 15, getmaxy() / 2 + 140, str1);
		}

		if (button == 1)
		{
			dis = sqrt(pow((540 - mx), 2) + pow((100 - my), 2));
			if (dis <= 30)
			{
				setcolor(0);
				//				outtextxy(getmaxx()/2-20,getmaxy()/2+138,str2);
				string = readpass(getmaxx() / 2 - 80, getmaxy() / 2 + 166, 20);

				if (strcmp(string, "guest") == 0) //function
				{
					exit(0);
				}
			}

			dis = sqrt(pow((100 - mx), 2) + pow((100 - my), 2));
			if (dis <= 30)
			{
				setcolor(0);
				//				outtextxy(getmaxx()/2-50,getmaxy()/2+136,str2);
				string = readpass(getmaxx() / 2 - 80, getmaxy() / 2 + 166, 20);

				if (strcmp(string, "administrator") == 0)
				{
					exit(0);
				}
			}

			dis = sqrt(pow((100 - mx), 2) + pow((getmaxy() - 60 - my), 2));
			if (dis <= 15)
			{
				exit(0);
			}

			dis = sqrt(
				pow((getmaxx() - 100 - mx), 2) + pow((getmaxy() - 60 - my), 2));
			if (dis <= 20)
			{
				exit(0);
			}
		}

		if (strcmp(str1, str2) != 0 || flag == 0)
		{
			if (strcmp(str2, "GUEST") == 0)
				d = 20;
			if (strcmp(str2, "ADMINISTRATOR") == 0)
				d = 50;
			if (strcmp(str2, "SHUT DOWN") == 0)
				d = 36;
			if (strcmp(str2, "EXIT") == 0)
				d = 15;
			setcolor(0);
			outtextxy(getmaxx() / 2 - d, getmaxy() / 2 + 140, str2);
		}
	}
}

void freehand()
{
	while (!kbhit())
	{
		getmousepos(&button, &mx, &my);
		if (button == 1)
		{
			hidemouseptr();

			putpixel(mx, my, YELLOW);
			putpixel(mx - 1, my - 1, YELLOW);
			putpixel(mx - 1, my, YELLOW);
			putpixel(mx + 1, my + 1, YELLOW);
			putpixel(mx, my + 1, YELLOW);
			putpixel(mx - 1, my + 1, YELLOW);
			putpixel(mx, my - 1, YELLOW);
			putpixel(mx + 1, my - 1, YELLOW);
			putpixel(mx + 1, my, YELLOW);

			showmouseptr();
		}
	}
}
