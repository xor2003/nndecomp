//---------------------------------------------------------------------------
//-------------------------MAIN MENU HELP SECTION----------------------------
//---------------------------------------------------------------------------

void helpclear(void)
{
    gotoxy(36, 7);
    cprintf("                                      ");
    gotoxy(36, 8);
    cprintf("                                      ");
    gotoxy(36, 9);
    cprintf("                                      ");
    gotoxy(36, 10);
    cprintf("                                      ");
    gotoxy(36, 11);
    cprintf("                                      ");
    gotoxy(36, 12);
    cprintf("                                      ");
    gotoxy(36, 13);
    cprintf("                                      ");
    gotoxy(36, 14);
    cprintf("                                      ");
    gotoxy(36, 15);
    cprintf("                                      ");
    gotoxy(36, 16);
    cprintf("                                      ");
    gotoxy(36, 17);
    cprintf("                                      ");
    gotoxy(36, 18);
    cprintf("                                      ");
    gotoxy(36, 19);
    cprintf("                                      ");
}

void menuhelp(void)
{
    clrscr();
menuhelp:
    textbackground(WHITE);
    textcolor(BLACK);
    title();
    gotoxy(31, 4);
    cprintf("Know your MAIN MENU");
    textcolor(BLUE);
    gotoxy(8, 6);
    cprintf("1. Add Data");
    gotoxy(8, 8);
    cprintf("2. View Data");
    gotoxy(8, 10);
    cprintf("3. Delete Data");
    gotoxy(8, 12);
    cprintf("4. Export to .TXT File");
    gotoxy(8, 14);
    cprintf("5. Recovery Data");
    gotoxy(8, 16);
    cprintf("6. Settings");
    gotoxy(8, 18);
    cprintf("7. Help");
    gotoxy(8, 20);
    cprintf("8. Log Out");

    textcolor(BLACK);
    gotoxy(24, 22);
    cprintf("... Press Number to see HELP ...");
    gotoxy(29, 23);
    cprintf("For Exit , Press 'ESC'");
    boxi(35, 6, 20, 40);
    _setcursortype(_NOCURSOR);

    choice = getch();
    switch (choice)
    {
    case '1':
        textcolor(BLUE + BLINK);
        gotoxy(8, 6);
        cprintf("1. Add Data");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Add Data");
        gotoxy(37, 8);
        cprintf("This option will add your data to");
        gotoxy(37, 9);
        cprintf("Secure File with encryption into");
        gotoxy(37, 10);
        cprintf("currently opened account.");
        gotoxy(37, 12);
        cprintf("You can add following type of data:");
        gotoxy(37, 13);
        cprintf("1. E-mail Account");
        gotoxy(37, 14);
        cprintf("2. Bank Account");
        gotoxy(37, 15);
        cprintf("3. Secure Note");

        getch();
        helpclear();
        goto menuhelp;

    case '2':
        textcolor(BLUE + BLINK);
        gotoxy(8, 8);
        cprintf("2. View Data");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("View Data");
        gotoxy(37, 8);
        cprintf("This option will show your data from");
        gotoxy(37, 9);
        cprintf("previously saved Secure File with");
        gotoxy(37, 10);
        cprintf("decryption from currently opened");
        gotoxy(37, 11);
        cprintf("account.");
        gotoxy(37, 13);
        cprintf("You can view following type of data:");
        gotoxy(37, 14);
        cprintf("1. E-mail Account");
        gotoxy(37, 15);
        cprintf("2. Bank Account");
        gotoxy(37, 16);
        cprintf("3. Secure Note");

        getch();
        helpclear();
        goto menuhelp;

    case '3':
        textcolor(BLUE + BLINK);
        gotoxy(8, 10);
        cprintf("3. Delete Data");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Delete Data");
        gotoxy(37, 8);
        cprintf("This option will delete your selected");
        gotoxy(37, 9);
        cprintf("data of Secure File for temporary");
        gotoxy(37, 10);
        cprintf("state of period.");
        gotoxy(37, 12);
        cprintf("You can delete following type of data");
        gotoxy(37, 13);
        cprintf("1. E-mail Account");
        gotoxy(37, 14);
        cprintf("2. Bank Account");
        gotoxy(37, 15);
        cprintf("3. Secure Note");
        gotoxy(37, 17);
        cprintf("INFORMATION:");
        gotoxy(37, 18);
        cprintf("To delete data parmanently,you have");
        gotoxy(37, 19);
        cprintf("to delete Recovery Files of data.");

        getch();
        helpclear();
        goto menuhelp;

    case '4':
        textcolor(BLUE + BLINK);
        gotoxy(8, 12);
        cprintf("4. Export to .TXT File");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Export to .TXT File");
        gotoxy(37, 8);
        cprintf("This option will generate .TXT file");
        gotoxy(37, 9);
        cprintf("( Text Editor File ) with currently");
        gotoxy(37, 10);
        cprintf("opened file with E-mail Account and");
        gotoxy(37, 11);
        cprintf("Secure Note Data.");
        gotoxy(37, 13);
        cprintf("File will be exported in this path:");
        gotoxy(37, 14);
        cprintf("C:\\VPASS\\DATA\\USER\\FILES\\*.txt");
        gotoxy(37, 16);
        cprintf("INFORMATION:");
        gotoxy(37, 17);
        cprintf("For Security Reasons,your bank a\\c");
        gotoxy(37, 18);
        cprintf("data will not be exported into .txt");
        gotoxy(37, 19);
        cprintf("files.");

        getch();
        helpclear();
        goto menuhelp;

    case '5':
        textcolor(BLUE + BLINK);
        gotoxy(8, 14);
        cprintf("5. Recovery Data");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Recovery Data");
        gotoxy(37, 8);
        cprintf("This option will make you able to");
        gotoxy(37, 9);
        cprintf("restore ( Recover ) your data from");
        gotoxy(37, 10);
        cprintf("last three states of log-in session.");
        gotoxy(37, 11);
        cprintf("You can recover your all type of");
        gotoxy(37, 12);
        cprintf("data with this Recovery Option.");
        gotoxy(37, 14);
        cprintf("WARNING:");
        gotoxy(37, 15);
        cprintf("When you will recover your data,");
        gotoxy(37, 16);
        cprintf("you will lost your every data files");
        gotoxy(37, 17);
        cprintf("which are currently available into");
        gotoxy(37, 18);
        cprintf("your account. After that all log-in");
        gotoxy(37, 19);
        cprintf("session will be expired.");

        getch();
        helpclear();
        goto menuhelp;

    case '6':
        textcolor(BLUE + BLINK);
        gotoxy(8, 16);
        cprintf("6. Settings");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Settings");
        gotoxy(37, 8);
        cprintf("This option will make you able to");
        gotoxy(37, 9);
        cprintf("change your Personal Settings.");
        gotoxy(37, 11);
        cprintf("You can change following Settings:");
        gotoxy(37, 12);
        cprintf("%c View\\Edit Profile", (char)175);
        gotoxy(37, 13);
        cprintf("%c Security Option", (char)175);
        gotoxy(37, 14);
        cprintf("%c Enable\\Disable Protection", (char)175);
        gotoxy(37, 15);
        cprintf("%c Disable Account", (char)175);

        getch();
        helpclear();
        goto menuhelp;

    case '7':
        textcolor(BLUE + BLINK);
        gotoxy(8, 18);
        cprintf("7. Help");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Help");
        gotoxy(37, 8);
        cprintf("This option will make you able to");
        gotoxy(37, 9);
        cprintf("see HELP Topics of programs. You");
        gotoxy(37, 10);
        cprintf("can select various HELP Topics and");
        gotoxy(37, 11);
        cprintf("will able to get help.");
        gotoxy(37, 13);
        cprintf("You can get following type of Help:");
        gotoxy(37, 14);
        cprintf("1. Know Your Main Menu");
        gotoxy(37, 15);
        cprintf("2. END USER LICENSE AGREEMENT and");
        gotoxy(37, 16);
        cprintf("   PRIVACY POLICY");
        gotoxy(37, 17);
        cprintf("3. About Us");

        getch();
        helpclear();
        goto menuhelp;

    case '8':
        textcolor(BLUE + BLINK);
        gotoxy(8, 20);
        cprintf("8. Log Out");
        textcolor(BLACK);
        gotoxy(37, 7);
        cprintf("Log Out");
        gotoxy(37, 8);
        cprintf("This option will make you able to");
        gotoxy(37, 9);
        cprintf("log out from the current log-in");
        gotoxy(37, 10);
        cprintf("session. Your last third log-in");
        gotoxy(37, 11);
        cprintf("session will be expired as soon as");
        gotoxy(37, 12);
        cprintf("you log out from the session.");
        gotoxy(37, 14);
        cprintf("As you log out from the current");
        gotoxy(37, 15);
        cprintf("log-in session, this session will");
        gotoxy(37, 16);
        cprintf("be added to Recovery Data File.");
        getch();
        helpclear();
        goto menuhelp;

    case (char)27:
        break;

    default:
        textcolor(BLACK + BLINK);
        gotoxy(23, 23);
        cprintf("Please Select valid choice number.");
        getch();
        gotoxy(23, 23);
        cprintf("                                  ");
        goto menuhelp;
    }
}