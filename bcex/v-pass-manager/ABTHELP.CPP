//---------------------------------------------------------------------------
//------------------------ABOUT US HELP SECTION------------------------------
//---------------------------------------------------------------------------

void abouthelp(void)
{
	clrscr();
	textbackground(WHITE);
	textcolor(BLACK);
	title();
	gotoxy(33, 4);
	cprintf("About Us");
	box(5, 6, 22, 70);
	gotoxy(6, 9);
	line(68, 0, (char)196);
	textcolor(BLACK);
	gotoxy(31, 7);
	cprintf("VPass Manager v1.0");
	gotoxy(25, 8);
	cprintf("Keep your Trust, Safe your Data.");
	gotoxy(32, 10);
	cprintf("%c%c%cPROGRAMMER%c%c%c", (char)175, (char)175, (char)175,
			(char)174, (char)174, (char)174);
	textcolor(BLUE);
	gotoxy(29, 11);
	cprintf("Vivek Ishwarbhai Patel");
	gotoxy(36, 12);
	cprintf("11BCE073");
	gotoxy(24, 13);
	cprintf("Computer Engineering Department,");
	gotoxy(28, 14);
	cprintf("Institute of Technology,");
	gotoxy(31, 15);
	cprintf("Nirma University.");
	gotoxy(30, 16);
	cprintf("(M) +91 94289 60350");
	textcolor(BLACK);
	gotoxy(30, 18);
	cprintf("%c%c%cSpecial Thanks%c%c%c", (char)175, (char)175, (char)175,
			(char)174, (char)174, (char)174);
	textcolor(BLUE);
	gotoxy(27, 19);
	cprintf("Savan Patel     (11BCE084)");
	gotoxy(27, 20);
	cprintf("Deval Patel     (11BCE071)");
	gotoxy(27, 21);
	cprintf("Vivek Chaudhary (11BCE018)");

	_setcursortype(_NOCURSOR);
	gotoxy(25, 23);
	textcolor(BLACK + BLINK);
	cprintf("Press any key to go into HELP...");
	getch();
}