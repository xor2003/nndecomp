#include <stdio.h>
#include <conio.h>
#include <process.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <dos.h>
#include <time.h>
#include <mem.h>
#include <io.h>

#define UPARR 72
#define LEFTARR 75
#define DOWNARR 80
#define RIGHTARR 77
int m, s, s1, s2, s3, s4, s5, s6, s7, s8, fti, cti, dti, color, decolor, colset[3], delarr[1000];
char type[50];
struct time t[100];
void main(void)
{
    FILE *sa1, *sa2, *sa3, *sa4, *sa5, *per1, *per2, *per3, *del;
    int extfti(int, int, int, int), x, z, d, gm, sl, l, r, ln, y, y2, y3, y4, y5, y6, y7, sss, c, i, tt, ft, fc, pr, sc, j, ff, sy, sys, in, cou, n, em, am, iy, null;
    void sounddef(int), record(char), player(char), sig(void), eff(void), err(int), bod(int), menu(int), recplayer(char), fplay(void), dor(void), naam(char[5][50], int), nemu(char[50]), rot(), beep(int, int);
    char opt, o, op, so, a[1000], rec[1000], nam[5][50], temp[50][50], newn[50], te[50];
    if ((access("sta1.pi", 00) || access("sta2.pi", 00) || access("sta3.pi", 00)))
    {
        textbackground(WHITE);
        textcolor(BLACK);
        clrscr();
        printf("\n\n\t\t    FIRST TIME CONFIGRATION PIANO by Divins.\n\t\t   ككككككككككككككككككككككككككككككككككككككككك \n\n\n     This Will Configure The Product \"PIANO by Divins\" on your computer.\n\n\n\n");
        bod(BLACK);
        for (i = 2;; i++)
        {
            gotoxy(27, 15);
            if (i % 2 == 0)
                printf("PRESS ANY KEY TO CONTINUE");
            else
                printf("                         ");
            delay(300);
            gotoxy(24, 23);
            printf("PRESS Q TO ABORT INSTALLATION.");
            if (kbhit())
                break;
        }
        if (tolower(getch()) == 'q')
            abort();
        gotoxy(27, 15);
        printf("                         ");
        gotoxy(23, 23);
        printf("                                ");
        for (i = 0; i < 101; i++)
        {
            gotoxy(19, 17);
            if (i < 37)
            {
                printf("  Configuration In Progress........%d%", i);
                delay(50);
            }
            if (i > 37 && i < 69)
            {
                printf("Checking System Performance........%d%", i);
                delay(100);
            }
            else if (i > 69)
            {
                printf("Finalising System Configuration....%d%", i);
                if (i == 99)
                    delay(2000);
                else
                    delay(150);
            }
        }
        clrscr();
        gotoxy(17, 7);
        printf(" Piano Is Successfully Installed On Your System.\n\t\tكككككككككككككككككككككككككككككككككككككككككككككككك \n\n\n\n\t Setup Will Now Guid You Through The Basic Settings Of Piano.\n\n\t Please Select Your Preferences. You Also Can Change Them \n\n\t Manually After The Setup.");
        bod(BLACK);
        for (i = 2;; i++)
        {
            gotoxy(27, 21);
            if (i % 2 == 0)
                printf("PRESS ANY KEY TO CONTINUE");
            else
                printf("                         ");
            delay(300);
            if (kbhit())
            {
                getch();
                break;
            }
        }
        clrscr();
        textbackground(WHITE);
        for (d = 0; d < 3; d++)
        {
            clrscr();
            bod(BLACK);
            if (d != 0)
                for (i = 0; i < 3; i++)
                {
                    gotoxy(40, 12);
                    cprintf("\\");
                    delay(100);
                    gotoxy(40, 12);
                    cprintf("|");
                    delay(100);
                    gotoxy(40, 12);
                    cprintf("-");
                    delay(100);
                    gotoxy(40, 12);
                    cprintf("/");
                    delay(100);
                }
        inc:
            clrscr();
            bod(BLACK);
            switch (d)
            {
            case 2:
                strcpy(type, "Background");
                break;
            case 1:
                strcpy(type, "Text");
                break;
            case 0:
                strcpy(type, "Border");
                break;
            }
            y7 = 6;
            menu(5);
            for (;;)
            {
                textcolor(LIGHTGRAY);
                for (pr = 6; pr < 23; pr += 2)
                {
                    gotoxy(50, pr);
                    cprintf("%c", 174);
                }
                gotoxy(50, y7);
                textcolor(BLACK);
                cprintf("%c", 174);
                op = getch();
                if (op == DOWNARR && y7 != 22)
                {
                    y7 += 2;
                    gotoxy(50, y7);
                    cprintf("%c", 174);
                }
                if (op == UPARR && y7 != 6)
                {
                    y7 -= 2;
                    gotoxy(50, y7);
                    cprintf("%c", 174);
                }
                if (op == 13)
                    break;
            }
            if (d == 2)
            {
                if ((colset[0] == 0 && y7 == 6) || (colset[0] == 1 && y7 == 8) || (colset[0] == 2 && y7 == 10) || (colset[0] == 3 && y7 == 12) || (colset[0] == 4 && y7 == 14) || (colset[0] == 5 && y7 == 16) || (colset[0] == 6 && y7 == 18) || (colset[0] == 9 && y7 == 20) || (colset[0] == 10 && y7 == 22))
                {
                    rot();
                    err(4);
                    delay(2000);
                    goto inc;
                }
                if ((colset[1] == 0 && y7 == 6) || (colset[1] == 1 && y7 == 8) || (colset[1] == 2 && y7 == 10) || (colset[1] == 3 && y7 == 12) || (colset[1] == 4 && y7 == 14) || (colset[1] == 5 && y7 == 16) || (colset[1] == 6 && y7 == 18) || (colset[1] == 9 && y7 == 20) || (colset[1] == 10 && y7 == 22))
                {
                    rot();
                    err(3);
                    delay(2000);
                    goto inc;
                }
            }
            switch (y7)
            {
            case 6:
                colset[d] = 0;
                break;
            case 8:
                colset[d] = 1;
                break;
            case 10:
                colset[d] = 2;
                break;
            case 12:
                colset[d] = 3;
                break;
            case 14:
                colset[d] = 4;
                break;
            case 16:
                colset[d] = 5;
                break;
            case 18:
                colset[d] = 6;
                break;
            case 20:
                colset[d] = 9;
                break;
            case 22:
                colset[d] = 7;
                break;
            }
        }
        per1 = fopen("sta1.pi", "w");
        fprintf(per1, "-1");
        fclose(per1);
        per2 = fopen("sta2.pi", "w");
        fclose(per2);
        per3 = fopen("sta3.pi", "w");
        for (i = 0; i < 3; i++)
            fprintf(per3, "%d ", colset[i]);
        fclose(per3);
        eff();
        clrscr();
        gotoxy(35, 3);
        printf("SUCCESS!");
        gotoxy(34, 4);
        printf("كككككككككك\n\n\n\n\n\n\n\n\t\tPiano Has Been Successfully Installed On Your System\n\n\t\tPlease Restart This Application To Continue.\n\n\n\n\n\t\tProgramme Will Close Now. ");
        bod(BLACK);
        getch();
        exit(0);
    }
    else
    {
        per1 = fopen("sta1.pi", "r");
        fscanf(per1, "%d", &sy);
        fclose(per1);
        per2 = fopen("sta2.pi", "r");
        for (n = -1; n < sy;)
            fgets(nam[++n], 100, per2);
        fclose(per2);
        per3 = fopen("sta3.pi", "r");
        for (n = 0; n < 3; n++)
            fscanf(per3, "%d", &colset[n]);
        fclose(per3);
        color = colset[0];         // bod
        decolor = colset[1];       // text
        textbackground(colset[2]); // bg
    }
    y = 13;
    y3 = y4 = y5 = 9;
    y2 = 11;
    y6 = 10;
    y7 = 6;
    textcolor(decolor);
    clrscr();
    for (sc = 0, pr = 0; pr <= 100; pr += sc, sc += 2)
    {
        bod(color);
        if (sc > 19)
            pr = 100;
        gotoxy(5, 12);
        printf("\t\t\t    LOADING PIANO.....%d%\n", pr);
        if (sc > 19)
            break;
        sig();
        if (pr == 100)
            break;
    }
    gotoxy(31, 18);
    printf("  PRESS ENTER!");
no:
    if (getch() == 13)
        goto defaul;
    else
        goto no;
defaul:
    beep(300, 100);
    delay(25);
    beep(400, 100);
    delay(25);
    beep(500, 100);
    delay(25);
    beep(600, 299);
    delay(60);
    s = 200;
    m = 100;
    textcolor(decolor);
menu:
    clrscr();
    menu(1);
    for (;;)
    {
        if (colset[2] != 9)
            textcolor(colset[2]);
        else
            textcolor(BLUE);
        for (pr = 13; pr < 23; pr += 2)
        {
            gotoxy(54, pr);
            cprintf("%c", 174);
        }
        gotoxy(54, y);
        textcolor(decolor);
        cprintf("%c", 174);
        opt = getch();
        if (opt == DOWNARR && y != 21)
        {
            beep(3000, 20);
            y += 2;
            gotoxy(54, y);
            cprintf("%c", 174);
        }
        if (opt == UPARR && y != 13)
        {
            beep(3000, 20);
            y -= 2;
            gotoxy(54, y);
            cprintf("%c", 174);
        }
        if (opt == 13)
        {
            beep(1000, 30);
            beep(900, 30);
            break;
        }
    }
    switch (y)
    {
    case 13:
        goto piano;
    case 15:
        goto settings;
    case 17:
        goto again;
    case 19:
        goto play;
    case 21:
        goto exit;
    }
    if (opt == 99) /*Shold Never O
      ccur, Just to prevent malfunctoning of GOTO*/
    {
    play:
        clrscr();
        gotoxy(1, 1);
        bod(color);
        if (sy == -1)
        {
        fof:
            gotoxy(10, 10);
            printf("\t  No Recordings Available!! Press Any Key To Return.");
            getch();
            goto menu;
        }
        memset(rec, 0, 100);
        naam(nam, sy);
        switch (sy)
        {
        case 0:
            sys = 9;
            break;
        case 1:
            sys = 11;
            break;
        case 2:
            sys = 13;
            break;
        case 3:
            sys = 15;
            break;
        case 4:
            sys = 17;
            break;
        default:
            goto fof;
        }
        clrscr();
        for (;;)
        {
            naam(nam, sy);
            if (colset[2] != 9)
                textcolor(colset[2]);
            else
                textcolor(BLUE);
            for (pr = 9; pr <= sys; pr += 2)
            {
                gotoxy(54, pr);
                cprintf("%c", 174);
            }
            gotoxy(54, y4);
            textcolor(decolor);
            cprintf("%c", 174);
            opt = getch();
            if (opt == DOWNARR && y4 != sys)
            {
                beep(3000, 20);
                y4 += 2;
                gotoxy(54, y4);
                cprintf("%c", 174);
            }
            if (opt == UPARR && y4 != 9)
            {
                beep(3000, 20);
                y4 -= 2;
                gotoxy(54, y4);
                cprintf("%c", 174);
            }
            if (tolower(opt) == 'b')
                goto menu;
            if (opt == 13)
            {
                beep(1000, 30);
                beep(900, 30);
                break;
            }
        }
        switch (y4)
        {
        case 9:
            iy = 0;
            break;
        case 11:
            iy = 1;
            break;
        case 13:
            iy = 2;
            break;
        case 15:
            iy = 3;
            break;
        case 17:
            iy = 4;
            break;
        }
    otto:
        for (em = 0; em <= sy; em++)
            if (nam[em][strlen(nam[em]) - 1] == '\n')
                nam[em][strlen(nam[em]) - 1] = '\0';
        clrscr();
        nemu(nam[iy]);
        for (;;)
        {
            if (colset[2] != 9)
                textcolor(colset[2]);
            else
                textcolor(BLUE);
            for (pr = 9; pr <= 15; pr += 2)
            {
                gotoxy(54, pr);
                cprintf("%c", 174);
            }
            gotoxy(54, y5);
            textcolor(decolor);
            cprintf("%c", 174);
            opt = getch();
            if (opt == DOWNARR && y5 != 15)
            {
                beep(3000, 20);
                y5 += 2;
                gotoxy(54, y5);
                printf("%c", 174);
            }
            if (opt == UPARR && y5 != 9)
            {
                beep(3000, 20);
                y5 -= 2;
                gotoxy(54, y5);
                printf("%c", 174);
            }
            if (opt == 13)
            {
                beep(1000, 30);
                beep(900, 30);
                break;
            }
        }
        switch (y4)
        {
        case 9:
            switch (y5)
            {
            case 9:
                if (nam[0][strlen(nam[0]) - 1] == '\n')
                    nam[0][strlen(nam[0]) - 1] = '\0';
                gotoxy(29, 23);
                printf("Please Wait.....");
                sa1 = fopen(nam[0], "r");
                memset(rec, 0, sizeof(rec));
                fgets(rec, 1000, sa1);
                fclose(sa1);
                strcpy(te, nam[0]);
                strcat(te, ".del");
                if ((rec[0] != '@') || (access(nam[0], 00)) || (access(te, 00)))
                {
                    gotoxy(24, 23);
                    printf("Error: Damaged Recorord File!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    delay(1700);
                    memset(te, 0, sizeof(te));
                    goto otto;
                }
                del = fopen(te, "r");
                for (x = 0; x < strlen(a) - 1;)
                    fscanf(del, "%d", &delarr[x++]);
                fclose(del);
                memset(te, 0, sizeof(te));
                sounddef(s);
                fplay();
                cti = 0;
                for (fc = 1; fc <= strlen(rec); fc++)
                    recplayer(rec[fc]);
                goto otto;
            case 11:
                if (nam[0][strlen(nam[0]) - 1] == '\n')
                    nam[0][strlen(nam[0]) - 1] = '\0';
                gotoxy(24, 23);
                printf("Enter New Name: ");
                gets(newn);
                for (null = 0, em = 0; newn[em] != '\0'; em++)
                    if (isspace(newn[em]) != 0)
                        null++;
                if (null == strlen(newn))
                {
                    null = 0;
                    gotoxy(23, 23);
                    printf("Error: Null String Detected!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    goto otto;
                }
                if (strlen(newn) > 12)
                {
                    gotoxy(15, 23);
                    printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(2);
                    goto otto;
                }
                if (errno == 5)
                {
                    gotoxy(23, 23);
                    printf("Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    memset(newn, 0, 50);
                    sleep(1);
                }
                else if (rename(nam[0], newn) == 0)
                {
                    strcpy(te, nam[0]);
                    strcat(te, ".del");
                    strcpy(nam[0], newn);
                    strcat(newn, ".del");
                    if (rename(te, newn) == 0)
                    {
                        memset(newn, 0, 50);
                        memset(te, 0, 50);
                        gotoxy(23, 23);
                        printf("         Succesfully Renamed!                     ");
                        beep(2000, 100);
                        delay(10);
                        beep(1500, 100);
                        delay(10);
                        beep(1000, 100);
                        sleep(1);
                    }
                }
                goto otto;

            case 13:
                if (nam[0][strlen(nam[0]) - 1] == '\n')
                    nam[0][strlen(nam[0]) - 1] = '\0';
                gotoxy(19, 21);
                printf("Are You Sure You Want To Delete \"%s\" ? [Y/N]", nam[0]);
            bak1:
                flushall();
                so = tolower(getch());
                switch (so)
                {
                case 'y':
                    if (remove(nam[0]) == 0)
                    {
                        strcat(nam[0], ".del");
                        if (remove(nam[0]) == 0)
                        {
                            gotoxy(15, 23);
                            printf("               Succesfully Deleted!                     ");
                            beep(2000, 100);
                            delay(10);
                            beep(1500, 100);
                            delay(10);
                            beep(1000, 100);
                            sleep(1);
                        }
                    }
                    for (cou = 0, in = 0; cou <= sy; cou++)
                    {
                        if (cou != 0)
                        {
                            strcpy(temp[in], nam[cou]);
                            in++;
                        }
                    }
                    memset(nam, 0, sizeof(nam));
                    for (in = 0; in < sy; in++)
                        strcpy(nam[in], temp[in]);
                    memset(temp, 0, sizeof(temp));
                    sy--;
                    goto play;
                case 'n':
                    goto otto;
                default:
                    gotoxy(20, 23);
                    printf(" Enter 'Y' for Yes Or 'N' For No.");
                    goto bak1;
                }
            case 15:
                goto play;
            }
        case 11:
            switch (y5)
            {
            case 9:
                if (nam[1][strlen(nam[1]) - 1] == '\n')
                    nam[1][strlen(nam[1]) - 1] = '\0';
                gotoxy(29, 23);
                printf("Please Wait.....");
                sa1 = fopen(nam[1], "r");
                memset(rec, 0, sizeof(rec));
                fgets(rec, 1000, sa1);
                fclose(sa1);
                strcpy(te, nam[1]);
                strcat(te, ".del");
                if ((rec[0] != '@') || (access(nam[1], 00)) || (access(te, 00)))
                {
                    gotoxy(24, 23);
                    printf("Error: Damaged Recorord File!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    delay(2000);
                    memset(te, 0, sizeof(te));
                    goto otto;
                }
                del = fopen(te, "r");
                for (x = 0; x < strlen(a) - 1;)
                    fscanf(del, "%d", &delarr[x++]);
                fclose(del);
                memset(te, 0, sizeof(te));
                sounddef(s);
                fplay();
                cti = 0;
                for (fc = 1; fc <= strlen(rec); fc++)
                    recplayer(rec[fc]);
                goto otto;
            case 11:
                if (nam[1][strlen(nam[1]) - 1] == '\n')
                    nam[1][strlen(nam[1]) - 1] = '\0';
                gotoxy(24, 23);
                printf("Enter New Name: ");
                gets(newn);
                for (null = 0, em = 0; newn[em] != '\0'; em++)
                    if (isspace(newn[em]) != 0)
                        null++;
                if (null == strlen(newn))
                {
                    null = 0;
                    gotoxy(23, 23);
                    printf("Error: Null String Detected!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    goto otto;
                }
                if (strlen(newn) > 12)
                {
                    gotoxy(15, 23);
                    printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(2);
                    goto otto;
                }
                if (errno == 5)
                {
                    gotoxy(23, 23);
                    printf("Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    memset(newn, 0, 50);
                    sleep(1);
                }
                else if (rename(nam[1], newn) == 0)
                {
                    strcpy(te, nam[1]);
                    strcat(te, ".del");
                    strcpy(nam[1], newn);
                    strcat(newn, ".del");
                    if (rename(te, newn) == 0)
                    {
                        memset(newn, 0, 50);
                        memset(te, 0, 50);
                        gotoxy(23, 23);
                        printf("         Succesfully Renamed!                     ");
                        beep(2000, 100);
                        delay(10);
                        beep(1500, 100);
                        delay(10);
                        beep(1000, 100);
                        sleep(1);
                    }
                }
                goto otto;

            case 13:
                if (nam[1][strlen(nam[1]) - 1] == '\n')
                    nam[1][strlen(nam[1]) - 1] = '\0';
                gotoxy(19, 21);
                printf("Are You Sure You Want To Delete \"%s\" ? [Y/N]", nam[1]);
            bak2:
                flushall();
                so = tolower(getch());
                switch (so)
                {
                case 'y':
                    if (remove(nam[1]) == 0)
                    {
                        strcat(nam[1], ".del");
                        if (remove(nam[1]) == 0)
                        {
                            gotoxy(15, 23);
                            printf("               Succesfully Deleted!                     ");
                            beep(2000, 100);
                            delay(10);
                            beep(1500, 100);
                            delay(10);
                            beep(1000, 100);
                            sleep(1);
                            y4 -= 2;
                        }
                    }
                    for (cou = 0, in = 0; cou <= sy; cou++)
                    {
                        if (cou != 1)
                        {
                            strcpy(temp[in], nam[cou]);
                            in++;
                        }
                    }
                    memset(nam, 0, sizeof(nam));
                    for (in = 0; in < sy; in++)
                        strcpy(nam[in], temp[in]);
                    memset(temp, 0, sizeof(temp));
                    sy--;
                    goto play;
                case 'n':
                    goto otto;
                default:
                    gotoxy(20, 23);
                    printf(" Enter 'Y' for Yes Or 'N' For No.");
                    goto bak2;
                }
            case 15:
                goto play;
            }
        case 13:
            switch (y5)
            {
            case 9:
                if (nam[2][strlen(nam[2]) - 1] == '\n')
                    nam[2][strlen(nam[2]) - 1] = '\0';
                gotoxy(29, 23);
                printf("Please Wait.....");
                sa1 = fopen(nam[2], "r");
                memset(rec, 0, sizeof(rec));
                fgets(rec, 1000, sa1);
                fclose(sa1);
                strcpy(te, nam[2]);
                strcat(te, ".del");
                if ((rec[0] != '@') || (access(nam[2], 00)) || (access(te, 00)))
                {
                    gotoxy(24, 23);
                    printf("Error: Damaged Recorord File!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    delay(2000);
                    memset(te, 0, sizeof(te));
                    goto otto;
                }
                del = fopen(te, "r");
                for (x = 0; x < strlen(a) - 1;)
                    fscanf(del, "%d", &delarr[x++]);
                fclose(del);
                memset(te, 0, sizeof(te));
                sounddef(s);
                fplay();
                cti = 0;
                for (fc = 1; fc <= strlen(rec); fc++)
                    recplayer(rec[fc]);
                goto otto;
            case 11:
                if (nam[2][strlen(nam[2]) - 1] == '\n')
                    nam[2][strlen(nam[2]) - 1] = '\0';
                gotoxy(24, 23);
                printf("Enter New Name: ");
                gets(newn);
                for (null = 0, em = 0; newn[em] != '\0'; em++)
                    if (isspace(newn[em]) != 0)
                        null++;
                if (null == strlen(newn))
                {
                    null = 0;
                    gotoxy(23, 23);
                    printf("Error: Null String Detected!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    goto otto;
                }
                if (strlen(newn) > 12)
                {
                    gotoxy(15, 23);
                    printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(2);
                    goto otto;
                }
                if (errno == 5)
                {
                    gotoxy(23, 23);
                    printf("Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    memset(newn, 0, 50);
                    sleep(1);
                }
                else if (rename(nam[2], newn) == 0)
                {
                    strcpy(te, nam[2]);
                    strcat(te, ".del");
                    strcpy(nam[2], newn);
                    strcat(newn, ".del");
                    if (rename(te, newn) == 0)
                    {
                        memset(newn, 0, 50);
                        memset(te, 0, 50);
                        gotoxy(23, 23);
                        printf("         Succesfully Renamed!                     ");
                        beep(2000, 100);
                        delay(10);
                        beep(1500, 100);
                        delay(10);
                        beep(1000, 100);
                        sleep(1);
                    }
                }
                goto otto;

            case 13:
                if (nam[2][strlen(nam[2]) - 1] == '\n')
                    nam[2][strlen(nam[2]) - 1] = '\0';
                gotoxy(19, 21);
                printf("Are You Sure You Want To Delete \"%s\" ? [Y/N]", nam[2]);
            bak3:
                flushall();
                so = tolower(getch());
                switch (so)
                {
                case 'y':
                    if (remove(nam[2]) == 0)
                    {
                        strcat(nam[2], ".del");
                        if (remove(nam[2]) == 0)
                        {
                            gotoxy(15, 23);
                            printf("               Succesfully Deleted!                     ");
                            beep(2000, 100);
                            delay(10);
                            beep(1500, 100);
                            delay(10);
                            beep(1000, 100);
                            sleep(1);
                            y4 -= 2;
                        }
                    }
                    for (cou = 0, in = 0; cou <= sy; cou++)
                    {
                        if (cou != 2)
                        {
                            strcpy(temp[in], nam[cou]);
                            in++;
                        }
                    }
                    memset(nam, 0, sizeof(nam));
                    for (in = 0; in < sy; in++)
                        strcpy(nam[in], temp[in]);
                    memset(temp, 0, sizeof(temp));
                    sy--;
                    goto play;
                case 'n':
                    goto otto;
                default:
                    gotoxy(20, 23);
                    printf(" Enter 'Y' for Yes Or 'N' For No.");
                    goto bak3;
                }
            case 15:
                goto play;
            }
        case 15:
            switch (y5)
            {
            case 9:
                if (nam[3][strlen(nam[3]) - 1] == '\n')
                    nam[3][strlen(nam[3]) - 1] = '\0';
                gotoxy(29, 23);
                printf("Please Wait.....");
                sa1 = fopen(nam[3], "r");
                memset(rec, 0, sizeof(rec));
                fgets(rec, 1000, sa1);
                fclose(sa1);
                strcpy(te, nam[3]);
                strcat(te, ".del");
                if ((rec[0] != '@') || (access(nam[3], 00)) || (access(te, 00)))
                {
                    gotoxy(24, 23);
                    printf("Error: Damaged Recorord File!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    delay(2000);
                    memset(te, 0, sizeof(te));
                    goto otto;
                }
                del = fopen(te, "r");
                for (x = 0; x < strlen(a) - 1;)
                    fscanf(del, "%d", &delarr[x++]);
                fclose(del);
                memset(te, 0, sizeof(te));
                sounddef(s);
                fplay();
                cti = 0;
                for (fc = 1; fc <= strlen(rec); fc++)
                    recplayer(rec[fc]);
                goto otto;
            case 11:
                if (nam[3][strlen(nam[3]) - 1] == '\n')
                    nam[3][strlen(nam[3]) - 1] = '\0';
                gotoxy(24, 23);
                printf("Enter New Name: ");
                gets(newn);
                for (null = 0, em = 0; newn[em] != '\0'; em++)
                    if (isspace(newn[em]) != 0)
                        null++;
                if (null == strlen(newn))
                {
                    null = 0;
                    gotoxy(23, 23);
                    printf("Error: Null String Detected!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    goto otto;
                }
                if (strlen(newn) > 12)
                {
                    gotoxy(15, 23);
                    printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(2);
                    goto otto;
                }
                if (errno == 5)
                {
                    gotoxy(23, 23);
                    printf("Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    memset(newn, 0, 50);
                    sleep(1);
                }
                else if (rename(nam[3], newn) == 0)
                {
                    strcpy(te, nam[3]);
                    strcat(te, ".del");
                    strcpy(nam[3], newn);
                    strcat(newn, ".del");
                    if (rename(te, newn) == 0)
                    {
                        memset(newn, 0, 50);
                        memset(te, 0, 50);
                        gotoxy(23, 23);
                        printf("         Succesfully Renamed!                     ");
                        beep(2000, 100);
                        delay(10);
                        beep(1500, 100);
                        delay(10);
                        beep(1000, 100);
                        sleep(1);
                    }
                }
                goto otto;

            case 13:
                if (nam[3][strlen(nam[3]) - 1] == '\n')
                    nam[3][strlen(nam[3]) - 1] = '\0';
                gotoxy(19, 21);
                printf("Are You Sure You Want To Delete \"%s\" ? [Y/N]", nam[3]);
            bak4:
                flushall();
                so = tolower(getch());
                switch (so)
                {
                case 'y':
                    if (remove(nam[3]) == 0)
                    {
                        strcat(nam[3], ".del");
                        if (remove(nam[3]) == 0)
                        {
                            gotoxy(15, 23);
                            printf("               Succesfully Deleted!                     ");
                            beep(2000, 100);
                            delay(10);
                            beep(1500, 100);
                            delay(10);
                            beep(1000, 100);
                            sleep(1);
                            y4 -= 2;
                        }
                    }
                    for (cou = 0, in = 0; cou <= sy; cou++)
                    {
                        if (cou != 3)
                        {
                            strcpy(temp[in], nam[cou]);
                            in++;
                        }
                    }
                    memset(nam, 0, sizeof(nam));
                    for (in = 0; in < sy; in++)
                        strcpy(nam[in], temp[in]);
                    memset(temp, 0, sizeof(temp));
                    sy--;
                    goto play;
                case 'n':
                    goto otto;
                default:
                    gotoxy(20, 23);
                    printf(" Enter 'Y' for Yes Or 'N' For No.");
                    goto bak4;
                }
            case 15:
                goto play;
            }
        case 17:
            switch (y5)
            {
            case 9:
                if (nam[4][strlen(nam[4]) - 1] == '\n')
                    nam[4][strlen(nam[4]) - 1] = '\0';
                gotoxy(29, 23);
                printf("Please Wait.....");
                sa1 = fopen(nam[4], "r");
                memset(rec, 0, sizeof(rec));
                fgets(rec, 1000, sa1);
                fclose(sa1);
                strcpy(te, nam[4]);
                strcat(te, ".del");
                if ((rec[0] != '@') || (access(nam[4], 00)) || (access(te, 00)))
                {
                    gotoxy(24, 23);
                    printf("Error: Damaged Recorord File!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    delay(2000);
                    memset(te, 0, sizeof(te));
                    goto otto;
                }
                del = fopen(te, "r");
                for (x = 0; x < strlen(a) - 1;)
                    fscanf(del, "%d", &delarr[x++]);
                fclose(del);
                memset(te, 0, sizeof(te));
                sounddef(s);
                fplay();
                cti = 0;
                for (fc = 1; fc <= strlen(rec); fc++)
                    recplayer(rec[fc]);
                goto otto;
            case 11:
                if (nam[4][strlen(nam[4]) - 1] == '\n')
                    nam[4][strlen(nam[4]) - 1] = '\0';
                gotoxy(24, 23);
                printf("Enter New Name: ");
                gets(newn);
                for (null = 0, em = 0; newn[em] != '\0'; em++)
                    if (isspace(newn[em]) != 0)
                        null++;
                if (null == strlen(newn))
                {
                    null = 0;
                    gotoxy(23, 23);
                    printf("Error: Null String Detected!");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    goto otto;
                }
                if (strlen(newn) > 12)
                {
                    gotoxy(15, 23);
                    printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(2);
                    goto otto;
                }
                if (errno == 5)
                {
                    gotoxy(23, 23);
                    printf("Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    memset(newn, 0, 50);
                    sleep(1);
                }
                else if (rename(nam[4], newn) == 0)
                {
                    strcpy(te, nam[4]);
                    strcat(te, ".del");
                    strcpy(nam[4], newn);
                    strcat(newn, ".del");
                    if (rename(te, newn) == 0)
                    {
                        memset(newn, 0, 50);
                        memset(te, 0, 50);
                        gotoxy(23, 23);
                        printf("         Succesfully Renamed!                     ");
                        beep(2000, 100);
                        delay(10);
                        beep(1500, 100);
                        delay(10);
                        beep(1000, 100);
                        sleep(1);
                    }
                }
                goto otto;

            case 13:
                if (nam[4][strlen(nam[4]) - 1] == '\n')
                    nam[4][strlen(nam[4]) - 1] = '\0';
                gotoxy(19, 21);
                printf("Are You Sure You Want To Delete \"%s\" ? [Y/N]", nam[4]);
            bak5:
                flushall();
                so = tolower(getch());
                switch (so)
                {
                case 'y':
                    if (remove(nam[4]) == 0)
                    {
                        strcat(nam[4], ".del");
                        if (remove(nam[4]) == 0)
                        {
                            gotoxy(15, 23);
                            printf("               Succesfully Deleted!                     ");
                            beep(2000, 100);
                            delay(10);
                            beep(1500, 100);
                            delay(10);
                            beep(1000, 100);
                            sleep(1);
                            y4 -= 2;
                        }
                    }
                    for (cou = 0, in = 0; cou <= sy; cou++)
                    {
                        if (cou != 4)
                        {
                            strcpy(temp[in], nam[cou]);
                            in++;
                        }
                    }
                    memset(nam, 0, sizeof(nam));
                    for (in = 0; in < sy; in++)
                        strcpy(nam[in], temp[in]);
                    memset(temp, 0, sizeof(temp));
                    sy--;
                    goto play;
                case 'n':
                    goto otto;
                default:
                    gotoxy(20, 23);
                    printf(" Enter 'Y' for Yes Or 'N' For No.");
                    goto bak5;
                }
            case 15:
                goto play;
            }
        }
    }
    if (opt == 99) /*Shold Never Occur, Just to prevent malfunctoning of GOTO*/
    {
    again:
        clrscr();
        sounddef(s);
        printf("\n\n\t\t\t   Piano is On Recording Mode!\n\n\n\t\t You Can Play Piano Using Keyboard Keys From A-L.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t Once completed Press Enter To Stop Recording.");
        gotoxy(1, 1);
        bod(color);
        dti = cti = 0;
        for (ln = 0;;)
        {
            o = tolower(getch());
            if (o == 'a' || o == 's' || o == 'd' || o == 'f' || o == 'g' || o == 'h' || o == 'j' || o == 'k' || o == 'l')
                a[ln++] = o;
            record(o);
            if (o == 13)
                break;
        }
    }
    if (ln == 0)
    {
        clrscr();
        for (sss = 5; sss != 0; sss--)
        {
            gotoxy(20, 10);
            printf("Nothing Recorded. Please Try Again In %d.", sss);
            beep(100, 100);
            delay(100);
            beep(60, 100);
            gotoxy(1, 1);
            bod(color);
            delay(1000);
        }
        goto again;
    }
    clrscr();
    printf("\n\n\n\n\n\n\n\n\n\n\n\n\tSuccessfully Recorded. Press Any Key To Here Your Recordings....");
    gotoxy(1, 1);
    bod(color);
    getch();
replay:
    fplay();
    cti = 0;
    for (d = 0; d <= ln; d++)
        recplayer(a[d]);
smu:
    clrscr();
    menu(3);
    for (;;)
    {
        if (colset[2] != 9)
            textcolor(colset[2]);
        else
            textcolor(BLUE);
        for (pr = 9; pr <= 17; pr += 2)
        {
            gotoxy(54, pr);
            cprintf("%c", 174);
        }
        gotoxy(54, y2);
        textcolor(decolor);
        cprintf("%c", 174);
        so = getch();
        if (so == DOWNARR && y2 < 17)
        {
            beep(3000, 20);
            gotoxy(54, y2 + 2);
            y2 += 2;
            cprintf("%c", 174);
        }
        if (so == UPARR && y2 > 11)
        {
            beep(3000, 20);
            gotoxy(54, y2 - 2);
            y2 -= 2;
            cprintf("%c", 174);
        }
        if (so == 13)
        {
            beep(1000, 30);
            beep(900, 30);
            break;
        }
    }
    switch (y2)
    {
    case 11:
        goto replay;
    case 13:
        goto reco;
    case 15:
        i = 0;
        memset(a, 0, 1000);
        goto menu;
    case 17:
        i = 0;
        memset(a, 0, 1000);
        goto exit;
    }
    if (opt == 99) /*Shold Never Occur, Just to prevent malfunctoning of GOTO*/
    {
    reco:
        gotoxy(24, 23);
        if (sy < 4)
        {
            printf("Enter A Name: ");
            gets(te);
            for (null = 0, em = 0; te[em] != '\0'; em++)
                if (isspace(te[em]) != 0)
                    null++;
            if (null == strlen(te))
            {
                gotoxy(22, 23);
                printf("     Error: Null String Detected.");
                beep(100, 100);
                delay(100);
                beep(60, 100);
                sleep(1);
                memset(te, 0, sizeof(te));
                goto smu;
            }
            if (strlen(te) > 12)
            {
                gotoxy(15, 23);
                printf("Error: Name Should Only Have A Maximum Of 12 Characters.");
                beep(100, 100);
                delay(100);
                beep(60, 100);
                sleep(2);
                memset(te, 0, sizeof(te));
                goto smu;
            }
            for (em = 0; em < sy + 1; em++)
                if (strcmp(te, nam[em]) == 0)
                {
                    gotoxy(22, 23);
                    printf("     Error: File Already Exists.");
                    beep(100, 100);
                    delay(100);
                    beep(60, 100);
                    sleep(1);
                    memset(te, 0, sizeof(te));
                    goto smu;
                }
            strcpy(nam[++sy], te);
            sa1 = fopen(nam[sy], "w");
            fprintf(sa1, "@%s", a);
            fclose(sa1);
            strcat(te, ".del");
            del = fopen(te, "w");
            for (z = 0; z < strlen(a); z++)
                fprintf(del, "%d ", delarr[z]);
            fclose(del);
            memset(te, 0, sizeof(te));
            gotoxy(23, 23);
            printf("         Succesfully Saved!                             ");
            beep(2000, 100);
            delay(10);
            beep(1500, 100);
            delay(10);
            beep(1000, 100);
            sleep(1);
            goto smu;
        }
        else
            gotoxy(27, 23);
        printf("     Limit Of 5 Reached!!");
        beep(100, 100);
        delay(100);
        beep(60, 100);
        sleep(1);
        goto smu;
    }
    if (opt == 99) /*Shold Never Occur, Just to prevent malfunctoning of GOTO*/
    {
    settings:
        clrscr();
        menu(2);
        for (;;)
        {
            if (colset[2] != 9)
                textcolor(colset[2]);
            else
                textcolor(BLUE);
            for (pr = 9; pr <= 17; pr += 2)
            {
                gotoxy(59, pr);
                cprintf("%c", 174);
            }
            gotoxy(59, y3);
            textcolor(decolor);
            cprintf("%c", 174);
            op = getch();
            if (op == DOWNARR && y3 != 17)
            {
                beep(3000, 20);
                gotoxy(59, y3 + 2);
                y3 += 2;
                cprintf("%c", 174);
            }
            if (op == UPARR && y3 != 9)
            {
                beep(3000, 20);
                gotoxy(59, y3 - 2);
                y3 -= 2;
                cprintf("%c", 174);
            }
            if (op == 13)
            {
                beep(1000, 30);
                beep(900, 30);
                break;
            }
        }
        switch (y3)
        {
        case 9:
            clrscr();
            printf("\n\n\n\n\tCurrent beep time in millisecond is %d.\n\n\n\tPlease Enter the time in millisecond to change it.\n\n\tNOTE:[1s=1000ms].", m);
            bod(color);
            gotoxy(7, 15);
            printf(" Your Required Time :\t");
            scanf("%d", &tt);
            if (tt == m)
            {
                printf("\n\n\n\tNo Changes Made. Press Any Key To Return.");
                beep(100, 100);
                delay(100);
                beep(60, 100);
                bod(color);
                getch();
                goto settings;
            }
            m = tt;
            printf("\n\n\tSuccessfully Changed To %dms.\n\n\tPress Any Key To Return", m);
            beep(2000, 100);
            delay(10);
            beep(1500, 100);
            delay(10);
            beep(1000, 100);
            gotoxy(1, 1);
            bod(color);
            getch();
            goto settings;
        case 13:
        col:
            clrscr();
            menu(4);
            for (;;)
            {
                if (colset[2] != 9)
                    textcolor(colset[2]);
                else
                    textcolor(BLUE);
                for (pr = 10; pr <= 16; pr += 2)
                {
                    gotoxy(54, pr);
                    cprintf("%c", 174);
                }
                gotoxy(54, y6);
                textcolor(decolor);
                cprintf("%c", 174);
                opt = getch();
                if (opt == DOWNARR && y6 != 16)
                {
                    beep(3000, 20);
                    y6 += 2;
                    gotoxy(54, y6);
                    printf("%c", 174);
                }
                if (opt == UPARR && y6 != 10)
                {
                    beep(3000, 20);
                    y6 -= 2;
                    gotoxy(54, y6);
                    printf("%c", 174);
                }
                if (opt == 13)
                {
                    beep(1000, 30);
                    beep(900, 30);
                    break;
                }
            }
            memset(type, 0, 50);
            switch (y6)
            {
            case 10:
                strcpy(type, "Text");
                break;
            case 12:
                strcpy(type, "Background");
                break;
            case 14:
                strcpy(type, "Border");
                break;
            case 16:
                goto settings;
            }
        loc:
            clrscr();
            menu(5);
            for (;;)
            {
                if (colset[2] != 9)
                    textcolor(colset[2]);
                else
                    textcolor(BLUE);
                for (pr = 6; pr <= 22; pr += 2)
                {
                    gotoxy(50, pr);
                    cprintf("%c", 174);
                }
                gotoxy(50, y7);
                textcolor(decolor);
                cprintf("%c", 174);
                op = getch();
                if (op == DOWNARR && y7 != 22)
                {
                    beep(3000, 20);
                    y7 += 2;
                    gotoxy(50, y7);
                    printf("%c", 174);
                }
                if (op == UPARR && y7 != 6)
                {
                    beep(3000, 20);
                    y7 -= 2;
                    gotoxy(50, y7);
                    printf("%c", 174);
                }
                if (tolower(op) == 'b')
                    goto col;
                if (op == 13)
                {
                    beep(1000, 30);
                    beep(900, 30);
                    break;
                }
            }
            switch (y6) // err checking switch
            {
            case 10:
                switch (y7) // text err color
                {
                case 6:
                    if (0 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (0 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 8:
                    if (1 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (1 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 10:
                    if (2 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (2 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 12:
                    if (3 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (3 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 14:
                    if (4 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (4 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 16:
                    if (5 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (5 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 18:
                    if (6 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (6 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 20:
                    if (9 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (9 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 22:
                    if (7 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(1);
                        delay(3000);
                        goto loc;
                    }
                    else if (7 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                }
                break;
            case 12:
                switch (y7) // bg err color
                {
                case 6:
                    if (0 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (0 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (0 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 8:
                    if (1 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(2000);
                        goto loc;
                    }
                    else if (1 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (1 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 10:
                    if (2 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (2 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (2 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 12:
                    if (3 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (3 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (3 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 14:
                    if (4 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (4 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (4 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 16:
                    if (5 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (5 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (5 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 18:
                    if (6 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (6 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (6 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 20:
                    if (9 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (9 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (9 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 22:
                    if (7 == colset[1])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(3);
                        delay(3000);
                        goto loc;
                    }
                    else if (7 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(4);
                        delay(2000);
                        goto loc;
                    }
                    else if (7 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                }
                break;
            case 14:
                switch (y7) // bod err color
                {
                case 6:
                    if (0 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (0 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 8:
                    if (1 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (1 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 10:
                    if (2 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (2 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 12:
                    if (3 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (3 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 14:
                    if (4 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (4 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 16:
                    if (5 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (5 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 18:
                    if (6 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (6 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 20:
                    if (9 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (9 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                case 22:
                    if (15 == colset[2])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(5);
                        delay(3000);
                        goto loc;
                    }
                    else if (15 == colset[0])
                    {
                        rot();
                        beep(100, 100);
                        delay(100);
                        beep(60, 100);
                        err(0);
                        delay(2000);
                        goto col;
                    }
                    break;
                }
            }
            switch (y6) // color setting switch
            {
            case 10:
                switch (y7) // text color
                {
                case 6:
                    eff();
                    decolor = 0;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 8:
                    eff();
                    decolor = 1;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 10:
                    eff();
                    decolor = 2;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 12:
                    eff();
                    decolor = 3;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 14:
                    eff();
                    decolor = 4;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 16:
                    eff();
                    decolor = 5;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 18:
                    eff();
                    decolor = 6;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 20:
                    eff();
                    decolor = 9;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                case 22:
                    eff();
                    decolor = 7;
                    textcolor(decolor);
                    colset[1] = decolor;
                    goto col;
                }
            case 12:
                switch (y7) // bg color
                {
                case 6:
                    eff();
                    textbackground(BLACK);
                    colset[2] = 0;
                    goto col;
                case 8:
                    eff();
                    textbackground(BLUE);
                    colset[2] = 1;
                    goto col;
                case 10:
                    eff();
                    textbackground(GREEN);
                    colset[2] = 2;
                    goto col;
                case 12:
                    eff();
                    textbackground(CYAN);
                    colset[2] = 3;
                    goto col;
                case 14:
                    eff();
                    textbackground(RED);
                    colset[2] = 4;
                    goto col;
                case 16:
                    eff();
                    textbackground(MAGENTA);
                    colset[2] = 5;
                    goto col;
                case 18:
                    eff();
                    textbackground(BROWN);
                    colset[2] = 6;
                    goto col;
                case 20:
                    eff();
                    textbackground(LIGHTBLUE);
                    colset[2] = 9;
                    goto col;
                case 22:
                    eff();
                    textbackground(LIGHTGRAY);
                    colset[2] = 7;
                    goto col;
                }
            case 14:
                switch (y7) // bod color
                {
                case 6:
                    eff();
                    color = 0;
                    bod(color);
                    colset[0] = color;
                    break;
                case 8:
                    eff();
                    color = 1;
                    bod(color);
                    colset[0] = color;
                    break;
                case 10:
                    eff();
                    color = 2;
                    bod(color);
                    colset[0] = color;
                    break;
                case 12:
                    eff();
                    color = 3;
                    bod(color);
                    colset[0] = color;
                    break;
                case 14:
                    eff();
                    color = 4;
                    bod(color);
                    colset[0] = color;
                    break;
                case 16:
                    eff();
                    color = 5;
                    bod(color);
                    colset[0] = color;
                    break;
                case 18:
                    eff();
                    color = 6;
                    bod(color);
                    colset[0] = color;
                    break;
                case 20:
                    eff();
                    color = 9;
                    bod(color);
                    colset[0] = color;
                    break;
                case 22:
                    eff();
                    color = 15;
                    bod(color);
                    colset[0] = color;
                    break;
                }
            }
            goto col;
        case 11:
            clrscr();
            printf("\n\n\n\n\n\tCurrent Staring Frequency Is %d.\n\n\n\tPlease Enter The New One : \t", s);
            gotoxy(1, 1);
            bod(color);
            gotoxy(36, 9);
            scanf("%d", &ft);
            if (s == ft)
            {
                printf("\n\n\n\tNo Changes Made. Press Any Key To Return.");
                beep(100, 100);
                delay(100);
                beep(60, 100);
                bod(color);
                getch();
                goto settings;
            }
            s = ft;
            printf("\n\n\n\tStarting Frequency Successfully Changed To %d.\n\n\tPress Any Key To Return\n", s);
            beep(2000, 100);
            delay(10);
            beep(1500, 100);
            delay(10);
            beep(1000, 100);
            gotoxy(1, 1);
            bod(color);
            getch();
            goto settings;
        case 15:
            clrscr();
            printf("\n\t\t\t      Setting Restoration.\n\t\t\t     ككككككككككككككككككككك\n\n\n\n\n\n\t   This Will RESET ALL YOUR Sound, Frequency And Appearence \n\n\t   Settings To Default.\n\n\n\n\n\t\t\t   Sure To Proceed ? [Y/N]");
            bod(color);
        uff:
            op = tolower(getch());
            switch (op)
            {
            case 'y':
                break;
            case 'n':
                goto settings;
            default:
                gotoxy(23, 23);
                printf(" Enter 'Y' for Yes Or 'N' For No.");
                goto uff;
            }
            eff();
            colset[0] = color = 3;
            colset[1] = decolor = 4;
            colset[2] = 0;
            textbackground(BLACK);
            textcolor(decolor);
            clrscr();
            printf("\n\n\n\n\n\n\n\n\n\t\t    Successfully Restored To Default Settings.\n\n\t\t\t   Press Any Key To Return.\n");
            beep(2000, 100);
            delay(10);
            beep(1500, 100);
            delay(10);
            beep(1000, 100);
            bod(color);
            delay(100);
            getch();
            goto defaul;
        case 17:
            goto menu;
        }
    }
    if (opt == 99) /*Shold Never Occur, Just to prevent malfunctoning og GOTO*/
    {
    piano:
        sounddef(s);
        clrscr();
        printf("\n\n\t Piano is ON! You Can Play It Using Keyboard Keys From A-L.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t   Press B To Go Back. \n\n\t\t\t   Press Q to Exit.");
        gotoxy(1, 1);
        bod(color);
        cti = 0;
        for (i = 0;; i++)
        {
            o = getch();
            player(o);
            if (o == 'B' || o == 'b')
                goto menu;
            if (o == 'q' || o == 'Q')
                goto exit;
        }
    exit:
        clrscr();
        gotoxy(23, 10);
        printf("Are You Sure You Want To Exit??  [Y/N]");
        gotoxy(1, 1);
        bod(color);
    h:
        so = getch();
        if (toupper(so) == 'Y')
        {
            per1 = fopen("sta1.pi", "w");
            fprintf(per1, "%d", sy);
            fclose(per1);
            for (em = 0; em <= sy; em++)
                if (nam[em][strlen(nam[em]) - 1] == '\n')
                    nam[em][strlen(nam[em]) - 1] = '\0';
            per2 = fopen("sta2.pi", "w");
            for (i = -1; i < sy;)
            {
                fputs(nam[++i], per2);
                fprintf(per2, "\n");
            }
            fclose(per2);
            per3 = fopen("sta3.pi", "w");
            for (i = 0; i < 3; i++)
                fprintf(per3, "%d ", colset[i]);
            fclose(per3);
            clrscr();
            printf("\n\n\n\n\n\n\n\n\n\n\t\t\t\t     Bye\n\n\n\n\n\n\n\n\n\n\t\t\t\t\t\t\t\tBy Divins.");
            gotoxy(1, 1);
            bod(color);
            for (i = 37; i < 42; i += 2)
            {
                gotoxy(i, 14);
                cprintf("ك  ");
                if (i != 41)
                    delay(800);
            }
            beep(600, 100);
            delay(25);
            beep(500, 100);
            delay(25);
            beep(400, 100);
            delay(25);
            beep(300, 299);
            exit(0);
        }
        else if (toupper(so) == 'N')
            goto menu;
        else
        {
            gotoxy(16, 20);
            printf("\t\tEnter 'Y' For Yes Or 'N' For No.");
            goto h;
        }
    }
}
void sounddef(int s)
{
    s1 = s + 100;
    s2 = s1 + 100;
    s3 = s2 + 100;
    s4 = s3 + 100;
    s5 = s4 + 100;
    s6 = s5 + 100;
    s7 = s6 + 100;
    s8 = s7 + 100;
}
void record(char o)
{
    int sec1, sec2, milsec1, milsec2;
    if (o == 'a' || o == 'A')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s);
            delay(m);
            nosound();
        }
    }
    if (o == 's' || o == 'S')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s1);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s1);
            delay(m);
            nosound();
        }
    }
    if (o == 'd' || o == 'D')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s2);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s2);
            delay(m);
            nosound();
        }
    }
    if (o == 'f' || o == 'F')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s3);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s3);
            delay(m);
            nosound();
        }
    }
    if (o == 'g' || o == 'G')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s4);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s4);
            delay(m);
            nosound();
        }
    }
    if (o == 'h' || o == 'H')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s5);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s5);
            delay(m);
            nosound();
        }
    }
    if (o == 'j' || o == 'J')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s6);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s6);
            delay(m);
            nosound();
        }
    }
    if (o == 'k' || o == 'K')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s7);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s7);
            delay(m);
            nosound();
        }
    }
    if (o == 'l' || o == 'L')
    {
        if (cti == 0)
        {
            gettime(&t[cti++]);
            sound(s8);
            delay(m);
            nosound();
        }
        else
        {
            gettime(&t[cti++]);
            sec1 = t[cti - 2].ti_sec;
            sec2 = t[cti - 1].ti_sec;
            milsec1 = t[cti - 2].ti_hund;
            milsec2 = t[cti - 1].ti_hund;
            delarr[dti++] = extfti(sec1, sec2, milsec1, milsec2);
            sound(s8);
            delay(m);
            nosound();
        }
    }
}
int extfti(int sec1, int sec2, int milsec1, int milsec2)
{
    if (milsec2 > milsec1 && sec2 > sec1)
        fti = ((milsec2 - milsec1) * 10) + ((sec2 - sec1) * 1000);
    else if (milsec2 > milsec1 && sec2 < sec1)
        fti = ((milsec2 - milsec1) * 10) + (((60 - sec1) + sec2) * 1000);
    else if (milsec2 < milsec1 && sec2 > sec1)
        fti = (((100 - milsec1) + milsec2) * 10) + ((sec2 - sec1 - 1) * 1000);
    else if (milsec2 < milsec1 && sec2 < sec1)
        fti = (((100 - milsec1) + milsec2) * 10) + (((60 - sec1) + sec2) * 1000);
    else if (milsec2 > milsec1 && sec2 == sec1)
        fti = abs((milsec2 - milsec1) * 10);
    else if (milsec2 < milsec1 && sec2 == sec1)
        fti = (((100 - milsec1) + milsec2) * 10);
    else
    {
        fti = 4;
        return fti;
    }
    if (fti <= 75 && fti > 25)
        return (fti - 25);
    else
        return (fti - 82);
}
void sig(void)
{
    gotoxy(40, 7);
    printf("%c", 15);
    delay(100);
    gotoxy(41, 7);
    printf("%c", 16);
    gotoxy(39, 7);
    printf("%c", 17);
    delay(100);
    gotoxy(42, 7);
    printf("%c", 16);
    gotoxy(38, 7);
    printf("%c", 17);
    delay(100);
    gotoxy(37, 7);
    printf("%c", 17);
    gotoxy(43, 7);
    printf("%c", 16);
    delay(100);
    gotoxy(36, 7);
    printf("         ");
}
void bod(int color)
{
    int i;
    textcolor(color);
    gotoxy(1, 1);
    cprintf("ة");
    for (i = 0; i < 77; i++)
        cprintf("ح");
    cprintf("»");
    for (i = 2; i < 25; i++)
    {
        gotoxy(1, i);
        cprintf("؛");
    }
    gotoxy(1, i);
    cprintf("ب");
    for (i = 0; i < 77; i++)
        cprintf("ح");
    cprintf("¼");
    for (i = 2; i < 25; i++)
    {
        gotoxy(79, i);
        cprintf("؛");
    }
    /* THE BOUNDARY IS DRAWN */
    textcolor(decolor);
}
void player(char a)
{
    if (a == 'a' || a == 'A')
    {
        sound(s);
        delay(m);
        nosound();
    }
    if (a == 's' || a == 'S')
    {
        sound(s1);
        delay(m);
        nosound();
    }
    if (a == 'd' || a == 'D')
    {
        sound(s2);
        delay(m);
        nosound();
    }
    if (a == 'f' || a == 'F')
    {
        sound(s3);
        delay(m);
        nosound();
    }
    if (a == 'g' || a == 'G')
    {
        sound(s4);
        delay(m);
        nosound();
    }
    if (a == 'h' || a == 'H')
    {
        sound(s5);
        delay(m);
        nosound();
    }
    if (a == 'j' || a == 'J')
    {
        sound(s6);
        delay(m);
        nosound();
    }
    if (a == 'k' || a == 'K')
    {
        sound(s7);
        delay(m);
        nosound();
    }
    if (a == 'l' || a == 'L')
    {
        sound(s8);
        delay(m);
        nosound();
    }
}
void menu(int o)
{
    int i, j;
    switch (o)
    {
    case 1:
        gotoxy(25, 2);
        printf(" _____");
        gotoxy(25, 3);
        printf("|     \\\n");
        gotoxy(25, 4);
        printf("| (_)  ]\n");
        gotoxy(25, 5);
        printf("|  ___/\n");
        gotoxy(25, 6);
        printf("| |(_) __ _   _ __   ___\n");
        gotoxy(25, 7);
        printf("| || |/ _` \\ | `_ \\ /   \\ \n");
        gotoxy(25, 8);
        printf("| || | (_| | | | | | (_) )_\n");
        gotoxy(25, 9);
        printf("|_||_|\\__,_| |_| |_|\\___/(_)\n");
        gotoxy(1, 1);
        printf("\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t Start Piano.\n\n\t\t\t Change Settings.\n\n\t\t\t Enter Recording Mode.\n\n\t\t\t Manage Saved Recording.\n\n\t\t\t Exit.");
        textcolor(color);
        gotoxy(1, 1);
        cprintf("ة");
        for (i = 0; i < 77; i++)
        {
            if (i == 8 || i == 16 || i == 57 || i == 65)
                cprintf("%c", 203);
            else
                cprintf("ح");
        }
        cprintf("»");
        gotoxy(2, 11);
        for (i = 0; i < 77; i++)
        {
            if (i == 8 || i == 16 || i == 57 || i == 65)
                cprintf("%c", 458);
            else
                cprintf("ح");
        }
        gotoxy(10, 2);
        cprintf("ب");
        cprintf("ح");
        cprintf("»");
        for (i = 3; i < 10; i++)
        {
            gotoxy(12, i);
            cprintf("؛");
        }
        gotoxy(12, i);
        cprintf("¼");
        gotoxy(11, i);
        cprintf("ح");
        gotoxy(10, i);
        cprintf("ة");
        gotoxy(18, 2);
        cprintf("¼");
        gotoxy(17, 2);
        cprintf("ح");
        gotoxy(16, 2);
        cprintf("ة");
        for (i = 3; i < 10; i++)
        {
            gotoxy(16, i);
            cprintf("؛");
        }
        gotoxy(16, i);
        cprintf("ب");
        cprintf("ح");
        cprintf("»");
        for (i = 2; i < 25; i++)
        {
            gotoxy(1, i);
            if (i == 11)
                cprintf("%c", 204);
            else
                cprintf("؛");
        }
        gotoxy(1, i);
        cprintf("ب");
        for (i = 0; i < 77; i++)
            cprintf("ح");
        cprintf("¼");
        for (i = 2; i < 25; i++)
        {
            gotoxy(79, i);
            if (i == 11)
                cprintf("%c", 185);
            else
                cprintf("؛");
        }
        gotoxy(59, 2);
        cprintf("ب");
        cprintf("ح");
        cprintf("»");
        for (i = 3; i < 10; i++)
        {
            gotoxy(61, i);
            cprintf("؛");
        }
        gotoxy(61, i);
        cprintf("¼");
        gotoxy(60, i);
        cprintf("ح");
        gotoxy(59, i);
        cprintf("ة");
        gotoxy(67, 2);
        cprintf("¼");
        gotoxy(66, 2);
        cprintf("ح");
        gotoxy(65, 2);
        cprintf("ة");
        for (i = 3; i < 10; i++)
        {
            gotoxy(65, i);
            cprintf("؛");
        }
        gotoxy(65, i);
        cprintf("ب");
        cprintf("ح");
        cprintf("»");
        for (i = 2; i < 25; i++)
        {
            gotoxy(1, i);
            if (i == 11)
                cprintf("%c", 204);
            else
                cprintf("؛");
        }
        gotoxy(1, i);
        cprintf("ب");
        /* THE BOUNDARY IS DRAWN */
        textcolor(decolor);
        break;
    case 2:
        printf("\n\n\t\t\t\t  Settings.\n\t\t\t\t  ككككككككك\n\n\n\n\n\t\t\t Change Sound-Time Manipulation.\n\n\t\t\t Change Frquency Settings.\n\n\t\t\t Change Appearences.\n\n\t\t\t Restore Settings.\n\n\t\t\t Go Back.");
        bod(color);
        break;
    case 3:
        printf("\n\n\n\n\t\t\t\t  Clip Completed.\n\t\t\t\t  ككككككككككككككك\n\n\n\n\n\t\t\t    Here It Again.\n\n\t\t\t    Save This Recording.\n\n\t\t\t    Return To Menu.\n\n\t\t\t    Exit.\n");
        bod(color);
        break;
    case 4:
        printf("\n\n\t\t\t   Appearence Settings.\n\t\t\t   كككككككككككككككككككك\n\n\n\n\n\n\t\t\t Change Text Color.\n\n\t\t\t Change Background Color.\n\n\t\t\t Change Border Color.\n\n\t\t\t Go Back.");
        bod(color);
        break;
    case 5:
        gotoxy(1, 2);
        printf("\t\t\t  Select Your %s Color.", type);
        gotoxy(27, 3);
        for (i = 0; i < strlen(type) + 19; i++)
            printf("ك");
        gotoxy(23, 6);
        if (colset[2] != 0)
            textcolor(BLACK);
        else
            textcolor(DARKGRAY);
        cprintf("BLACK");
        gotoxy(23, 8);
        if (colset[2] != 1 && colset[2] != 9)
            textcolor(BLUE);
        else if (colset[2] != 1)
            textcolor(LIGHTBLUE);
        else
            textcolor(DARKGRAY);
        cprintf("BLUE");
        gotoxy(23, 10);
        if (colset[2] != 2)
            textcolor(GREEN);
        else
            textcolor(DARKGRAY);
        cprintf("GREEN");
        gotoxy(23, 12);
        if (colset[2] != 3)
            textcolor(CYAN);
        else
            textcolor(DARKGRAY);
        cprintf("CYAN");
        gotoxy(23, 14);
        if (colset[2] != 4)
            textcolor(RED);
        else
            textcolor(DARKGRAY);
        cprintf("RED");
        gotoxy(23, 16);
        if (colset[2] != 5)
            textcolor(MAGENTA);
        else
            textcolor(DARKGRAY);
        cprintf("MAGENTA");
        gotoxy(23, 18);
        if (colset[2] != 6)
            textcolor(BROWN);
        else
            textcolor(DARKGRAY);
        cprintf("BROWN");
        gotoxy(23, 20);
        if (colset[2] != 9)
            textcolor(LIGHTBLUE);
        else
            textcolor(DARKGRAY);
        cprintf("LIGHT BLUE");
        gotoxy(23, 22);
        textcolor(WHITE);
        cprintf("WHITE");
        textcolor(decolor);
        bod(color);
    }
}
void beep(int s, int d)
{
    sound(s);
    delay(d);
    nosound();
}
void recplayer(char a)
{
    a = tolower(a);
    switch (a)
    {
    case 'a':
        sound(s);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 's':
        sound(s1);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'd':
        sound(s2);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'f':
        sound(s3);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'g':
        sound(s4);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'h':
        sound(s5);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;

    case 'j':
        sound(s6);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'k':
        sound(s7);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    case 'l':
        sound(s8);
        delay(m);
        nosound();
        delay(delarr[cti++]);
        break;
    }
}
void fplay(void)
{
    clrscr();
    printf("\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\t%c %c Playing....... %c %c\n", 14, 14, 14, 14);
    gotoxy(1, 1);
    bod(color);
}
void naam(char nam[5][50], int sy)
{
    int j, i;
    gotoxy(32, 3);
    printf("Your Recordings:-");
    gotoxy(32, 4);
    printf("ككككككككككككككككك");
    gotoxy(32, 23);
    printf("Press B to Go Back.");
    gotoxy(23, 9);
    for (j = 0, i = 11; j <= sy; j++, i += 2)
    {
        cprintf("%d.  %s", j + 1, nam[j]);
        gotoxy(23, i);
    }
    gotoxy(1, 1);
    bod(color);
}
void nemu(char nam[50])
{
    int i;
    gotoxy(38 - ((strlen(nam)) / 2) + 1, 3);
    puts(nam);
    gotoxy(38 - ((strlen(nam)) / 2) + 1, 4);
    for (i = 0; i < strlen(nam); i++)
        printf("ك");
    gotoxy(26, 9);
    printf("Play This Recording.\n\n\t\t\t Rename This Recording.\n\n\t\t\t Delete This Recording.\n\n\t\t\t Go Back.");
    gotoxy(1, 1);
    bod(color);
}
void err(int n)
{
    int i;
    switch (n)
    {
    case 0:
        textcolor(color);
        gotoxy(57, 8);
        cprintf("ة");
        for (i = 0; i < 14; i++)
            cprintf("ح");
        cprintf("»");
        gotoxy(57, 9);
        cprintf("؛");
        gotoxy(72, 9);
        cprintf("؛");
        gotoxy(57, 10);
        cprintf("%c", 199);
        gotoxy(72, 10);
        cprintf("%c", 438);
        gotoxy(58, 10);
        for (i = 0; i < 14; i++)
            cprintf("ؤ");
        for (i = 11; i < 16; i++)
        {
            gotoxy(57, i);
            cprintf("؛");
        }
        for (i = 11; i < 16; i++)
        {
            gotoxy(72, i);
            cprintf("؛");
        }
        gotoxy(72, i);
        cprintf("¼");
        gotoxy(57, i);
        cprintf("ب");
        for (i = 0; i < 14; i++)
            cprintf("ح");
        textcolor(decolor);
        gotoxy(59, 9);
        cprintf(" Message:");
        gotoxy(59, 12);
        cprintf(" No Changes");
        gotoxy(59, 14);
        cprintf(" Were Made!");
        break;
    case 1:
        textcolor(color);
        gotoxy(54, 8);
        cprintf("ة");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        cprintf("»");
        gotoxy(54, 9);
        cprintf("؛");
        gotoxy(73, 9);
        cprintf("؛");
        gotoxy(54, 10);
        cprintf("%c", 199);
        gotoxy(73, 10);
        cprintf("%c", 438);
        gotoxy(55, 10);
        for (i = 0; i < 18; i++)
            cprintf("ؤ");
        for (i = 11; i < 18; i++)
        {
            gotoxy(54, i);
            cprintf("؛");
        }
        for (i = 11; i < 18; i++)
        {
            gotoxy(73, i);
            cprintf("؛");
        }
        gotoxy(73, i);
        cprintf("¼");
        gotoxy(54, i);
        cprintf("ب");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        textcolor(decolor);
        gotoxy(56, 9);
        cprintf(" Error:");
        gotoxy(56, 12);
        cprintf("Text Color And");
        gotoxy(56, 14);
        cprintf("Background Color");
        gotoxy(56, 16);
        cprintf("Cant Be The Same!");
        break;
    case 3:
        textcolor(color);
        gotoxy(54, 8);
        cprintf("ة");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        cprintf("»");
        gotoxy(54, 9);
        cprintf("؛");
        gotoxy(73, 9);
        cprintf("؛");
        gotoxy(54, 10);
        cprintf("%c", 199);
        gotoxy(73, 10);
        cprintf("%c", 438);
        gotoxy(55, 10);
        for (i = 0; i < 18; i++)
            cprintf("ؤ");
        for (i = 11; i < 18; i++)
        {
            gotoxy(54, i);
            cprintf("؛");
        }
        for (i = 11; i < 18; i++)
        {
            gotoxy(73, i);
            cprintf("؛");
        }
        gotoxy(73, i);
        cprintf("¼");
        gotoxy(54, i);
        cprintf("ب");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        textcolor(decolor);
        gotoxy(56, 9);
        cprintf(" Error:");
        gotoxy(56, 12);
        cprintf("Background Color");
        gotoxy(56, 14);
        cprintf("And Text Color");
        gotoxy(56, 16);
        cprintf("Cant Be The Same!");
        break;
    case 4:
        textcolor(color);
        gotoxy(54, 8);
        cprintf("ة");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        cprintf("»");
        gotoxy(54, 9);
        cprintf("؛");
        gotoxy(73, 9);
        cprintf("؛");
        gotoxy(54, 10);
        cprintf("%c", 199);
        gotoxy(73, 10);
        cprintf("%c", 438);
        gotoxy(55, 10);
        for (i = 0; i < 18; i++)
            cprintf("ؤ");
        for (i = 11; i < 18; i++)
        {
            gotoxy(54, i);
            cprintf("؛");
        }
        for (i = 11; i < 18; i++)
        {
            gotoxy(73, i);
            cprintf("؛");
        }
        gotoxy(73, i);
        cprintf("¼");
        gotoxy(54, i);
        cprintf("ب");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        textcolor(decolor);
        gotoxy(56, 9);
        cprintf(" Error:");
        gotoxy(56, 12);
        cprintf("Background Color");
        gotoxy(56, 14);
        cprintf("And Border Color");
        gotoxy(56, 16);
        cprintf("Cant Be The Same!");
        break;
    case 5:
        textcolor(color);
        gotoxy(54, 8);
        cprintf("ة");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        cprintf("»");
        gotoxy(54, 9);
        cprintf("؛");
        gotoxy(73, 9);
        cprintf("؛");
        gotoxy(54, 10);
        cprintf("%c", 199);
        gotoxy(73, 10);
        cprintf("%c", 438);
        gotoxy(55, 10);
        for (i = 0; i < 18; i++)
            cprintf("ؤ");
        for (i = 11; i < 18; i++)
        {
            gotoxy(54, i);
            cprintf("؛");
        }
        for (i = 11; i < 18; i++)
        {
            gotoxy(73, i);
            cprintf("؛");
        }
        gotoxy(73, i);
        cprintf("¼");
        gotoxy(54, i);
        cprintf("ب");
        for (i = 0; i < 18; i++)
            cprintf("ح");
        textcolor(decolor);
        gotoxy(56, 9);
        cprintf(" Error:");
        gotoxy(56, 12);
        cprintf("Border Color And");
        gotoxy(56, 14);
        cprintf("Background Color");
        gotoxy(56, 16);
        cprintf("Cant Be The Same!");
    }
}
void rot(void)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        gotoxy(64, 12);
        cprintf("\\");
        delay(100);
        gotoxy(64, 12);
        cprintf("|");
        delay(100);
        gotoxy(64, 12);
        cprintf("-");
        delay(100);
        gotoxy(64, 12);
        cprintf("/");
        delay(100);
    }
}
void eff(void)
{
    int i, c;
    clrscr();
    bod(color);
    for (c = 0; c <= 1; c++)
    {
        textcolor(colset[2]);
        gotoxy(36, 10);
        printf("Working....");
        for (i = 37; i <= 43; i++)
        {
            gotoxy(33, 12);
            cprintf("            ");
            textcolor(decolor);
            gotoxy(i, 12);
            cprintf("%c", 790);
            delay(150);
        }
        for (; i >= 37; i--)
        {
            gotoxy(33, 12);
            cprintf("            ");
            textcolor(decolor);
            gotoxy(i, 12);
            cprintf("%c", 790);
            delay(150);
        }
    }
}
