//forward declaration
void openFileWindow(void);

//disactive all the running menu
void disactive(void)
{
	mainM = INACTIVE;
	fileM = INACTIVE;
	editM = INACTIVE;
	searchM = INACTIVE;
	runM = INACTIVE;
	compileM = INACTIVE;
	helpM = INACTIVE;
	return;
}

//check whether any menu is active or not
int isActiveMenu(void)
{
	return mainM + fileM + editM + searchM + runM + compileM + helpM;
}

//check whether any window is active or not
int isActiveWindow(void)
{
	return newW + openW;
}

//draw main borland window
void MENU(int X = 0)
{
	window(1, 1, 80, 25);
	clrscr();
	_setcursortype(_NOCURSOR);
	textbackground(WHITE);
	textcolor(BLUE);
	line(1999, 176);
	gotoxy(1, 25);
	line(80, ' ');
	gotoxy(1, 1);
	line(80, ' ');
	gotoxy(1, 24);
	line(80, 176);

	textcolor(BLACK);
	gotoxy(3, 1);
	cprintf("    ile   dit   earch   un   ompile   ebug   roject   ptions", 240);
	cprintf("     indow   elp");
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c System commands and Transfer programs", 179);

	textcolor(RED);
	gotoxy(3, 1);
	cprintf("%c", 240);
	gotoxy(6, 1);
	cprintf("F");
	gotoxy(12, 1);
	cprintf("E");
	gotoxy(18, 1);
	cprintf("S");
	gotoxy(26, 1);
	cprintf("R");
	gotoxy(31, 1);
	cprintf("C");
	gotoxy(40, 1);
	cprintf("D");
	gotoxy(47, 1);
	cprintf("P");
	gotoxy(56, 1);
	cprintf("O");
	gotoxy(67, 1);
	cprintf("W");
	gotoxy(75, 1);
	cprintf("H");
	gotoxy(2, 25);
	cprintf("F1");

	if (!X)
	{
		textbackground(GREEN);
		gotoxy(2, 1);
		cprintf(" %c ", 240);
	}
}

//default menu
void defaultMenu(void)
{
	if (mainM == ACTIVE)
	{
		mainM = INACTIVE;
		MENU(1);
		return;
	}
	disactive();
	mainM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU();
	window(1, 2, 21, 9);
	textbackground(WHITE);
	clrscr();
	boxi(2, 1, 8, 19, 2);
	textcolor(BLACK);
	gotoxy(4, 2);
	cprintf("Repaint desktop");
	gotoxy(4, 4);
	cprintf("GREP");
	gotoxy(4, 5);
	cprintf("Turbo Assembler");
	gotoxy(4, 6);
	cprintf("Turbo Debugger");
	gotoxy(4, 7);
	cprintf("Turbo Profiler");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("R");
	gotoxy(4, 4);
	cprintf("G");
	gotoxy(4, 5);
	cprintf("T");
	gotoxy(10, 6);
	cprintf("D");
	gotoxy(10, 7);
	cprintf("P");

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 10; temp++)
	{
		gotoxy(22, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(3, 10);
	line(19, 176);
}

//file menu
void fileMenu(void)
{
	if (fileM == ACTIVE)
	{
		fileM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	fileM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(5, 1);
	textcolor(RED);
	cprintf(" F", 240);
	textcolor(BLACK);
	cprintf("ile ", 240);
	textbackground(WHITE);
	window(4, 2, 24, 14);
	clrscr();
	boxi(2, 1, 13, 19, 6, 10);
	gotoxy(4, 2);
	cprintf("New");
	gotoxy(4, 3);
	cprintf("Open...      F3");
	gotoxy(4, 4);
	cprintf("Save         F2");
	gotoxy(4, 5);
	cprintf("Save as...");
	gotoxy(4, 6);
	cprintf("Save all");
	gotoxy(4, 8);
	cprintf("Change dir...");
	gotoxy(4, 9);
	cprintf("Print");
	gotoxy(4, 10);
	cprintf("DOS shell");
	gotoxy(4, 12);
	cprintf("Quit      Alt+X");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("N");
	gotoxy(4, 3);
	cprintf("O");
	gotoxy(4, 4);
	cprintf("S");
	gotoxy(5, 5);
	cprintf("a");
	gotoxy(10, 6);
	cprintf("l");
	gotoxy(4, 8);
	cprintf("C");
	gotoxy(4, 9);
	cprintf("P");
	gotoxy(4, 10);
	cprintf("D");
	gotoxy(4, 12);
	cprintf("Q");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c File-management commands (Open, Save, Print, etc.)", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 15; temp++)
	{
		gotoxy(25, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(6, 15);
	line(19, 176);
}

//edit menu
void editMenu(void)
{
	if (editM == ACTIVE)
	{
		editM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	editM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(11, 1);
	textcolor(RED);
	cprintf(" E", 240);
	textcolor(BLACK);
	cprintf("dit ", 240);
	textbackground(WHITE);
	window(10, 2, 39, 13);
	clrscr();
	boxi(2, 1, 12, 28, 3, 9);
	gotoxy(4, 2);
	cprintf("Undo            Alt+BkSp");
	gotoxy(4, 3);
	cprintf("Redo      Shift+Alt+BkSp");
	gotoxy(4, 5);
	cprintf("Cut            Shift+Del");
	gotoxy(4, 6);
	cprintf("Copy            Ctrl+Ins");
	gotoxy(4, 7);
	cprintf("Paste          Shift+Ins");
	gotoxy(4, 8);
	cprintf("Clear           Ctrl+Del");
	gotoxy(4, 9);
	cprintf("Copy example");
	gotoxy(4, 11);
	cprintf("Show clipboard");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("U");
	gotoxy(4, 3);
	cprintf("R");
	gotoxy(6, 5);
	cprintf("t");
	gotoxy(4, 6);
	cprintf("C");
	gotoxy(4, 7);
	cprintf("P");
	gotoxy(5, 8);
	cprintf("l");
	gotoxy(9, 9);
	cprintf("e");
	gotoxy(4, 11);
	cprintf("S");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c Editor operations, undo, and Clipboard access", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 13; temp++)
	{
		gotoxy(40, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(12, 14);
	line(30, 176);
}

//search menu
void searchMenu(void)
{
	if (searchM == ACTIVE)
	{
		searchM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	searchM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(17, 1);
	textcolor(RED);
	cprintf(" S", 240);
	textcolor(BLACK);
	cprintf("earch ", 240);
	textbackground(WHITE);
	window(16, 2, 46, 11);
	clrscr();
	boxi(2, 1, 10, 29, 4);
	gotoxy(4, 2);
	cprintf("Find...");
	gotoxy(4, 3);
	cprintf("Replace...");
	gotoxy(4, 4);
	cprintf("Search again       Ctrl+L");
	gotoxy(4, 6);
	cprintf("Go to line number...");
	gotoxy(4, 7);
	cprintf("Previous error     Alt+F7");
	gotoxy(4, 8);
	cprintf("Next error         Alt+F8");
	gotoxy(4, 9);
	cprintf("Locate function...");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("F");
	gotoxy(4, 3);
	cprintf("R");
	gotoxy(4, 4);
	cprintf("S");
	gotoxy(4, 6);
	cprintf("G");
	gotoxy(4, 7);
	cprintf("P");
	gotoxy(4, 8);
	cprintf("N");
	gotoxy(4, 9);
	cprintf("L");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c Text and error search commands", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 12; temp++)
	{
		gotoxy(47, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(18, 12);
	line(30, 176);
}

//run menu
void runMenu(void)
{
	if (runM == ACTIVE)
	{
		runM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	runM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(25, 1);
	textcolor(RED);
	cprintf(" R", 240);
	textcolor(BLACK);
	cprintf("un ", 240);
	textbackground(WHITE);
	window(24, 2, 52, 9);
	clrscr();
	boxi(2, 1, 8, 27);
	gotoxy(4, 2);
	cprintf("Run             Ctrl+F9");
	gotoxy(4, 3);
	cprintf("Program reset   Ctrl+F2");
	gotoxy(4, 4);
	cprintf("Go to cursor         F4");
	gotoxy(4, 5);
	cprintf("Trace into           F7");
	gotoxy(4, 6);
	cprintf("Step over            F8");
	gotoxy(4, 7);
	cprintf("Arguments...");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("R");
	gotoxy(4, 3);
	cprintf("P");
	gotoxy(4, 4);
	cprintf("G");
	gotoxy(4, 5);
	cprintf("T");
	gotoxy(4, 6);
	cprintf("S");
	gotoxy(4, 7);
	cprintf("A");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c Make and run the current program", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 10; temp++)
	{
		gotoxy(53, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(26, 10);
	line(29, 176);
}

//compile menu
void compileMenu(void)
{
	if (compileM == ACTIVE)
	{
		compileM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	compileM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(30, 1);
	textcolor(RED);
	cprintf(" C", 240);
	textcolor(BLACK);
	cprintf("ompile ", 240);
	textbackground(WHITE);
	window(28, 2, 56, 10);
	clrscr();
	boxi(2, 1, 9, 27, 5);
	gotoxy(4, 2);
	cprintf("Compile          Alt+F9");
	gotoxy(4, 3);
	cprintf("Make             F9");
	gotoxy(4, 4);
	cprintf("Link");
	gotoxy(4, 5);
	cprintf("Build all");
	gotoxy(4, 7);
	cprintf("Information...");
	gotoxy(4, 8);
	cprintf("Remove messages");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("C");
	gotoxy(4, 3);
	cprintf("M");
	gotoxy(4, 4);
	cprintf("L");
	gotoxy(4, 5);
	cprintf("B");
	gotoxy(4, 7);
	cprintf("I");
	gotoxy(4, 8);
	cprintf("R");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c Compile the file in the active Edit window", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);

	for (temp = 3; temp <= 10; temp++)
	{
		gotoxy(57, temp);
		cprintf("%c%c", 176, 176);
	}
	gotoxy(30, 11);
	line(29, 176);
}

//help menu
void helpMenu(void)
{
	if (helpM == ACTIVE)
	{
		helpM = INACTIVE;
		MENU(1);
		return;
	}

	disactive();
	helpM = ACTIVE;
	int temp;
	if (!isActiveWindow())
		MENU(1);
	textbackground(GREEN);
	gotoxy(74, 1);
	textcolor(RED);
	cprintf(" H", 240);
	textcolor(BLACK);
	cprintf("elp ", 240);
	textbackground(WHITE);
	window(50, 2, 80, 10);
	clrscr();
	boxi(2, 1, 9, 29, 6);
	gotoxy(4, 2);
	cprintf("Contents");
	gotoxy(4, 3);
	cprintf("Index            Shift+F1");
	gotoxy(4, 4);
	cprintf("Topic search      Ctrl+F1");
	gotoxy(4, 5);
	cprintf("Previous topic     Alt+F1");
	gotoxy(4, 6);
	cprintf("Help on help");
	gotoxy(4, 8);
	cprintf("About");

	textcolor(RED);
	gotoxy(4, 2);
	cprintf("C");
	gotoxy(4, 3);
	cprintf("I");
	gotoxy(4, 4);
	cprintf("T");
	gotoxy(4, 5);
	cprintf("P");
	gotoxy(4, 6);
	cprintf("H");
	gotoxy(4, 8);
	cprintf("A");

	window(1, 1, 80, 25);
	gotoxy(2, 25);
	cprintf("F1");

	textcolor(BLACK);
	gotoxy(5, 25);
	line(70, ' ');
	gotoxy(5, 25);
	cprintf("Help %c Show table of contents for online Help", 179);

	window(1, 1, 80, 25);
	textbackground(BLACK);
	textcolor(LIGHTGRAY);
	gotoxy(52, 11);
	line(29, 176);
}
