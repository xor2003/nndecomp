#include <conio.h>
#include <stdio.h>
#include <dos.h>
#include <process.h>
#include <stdlib.h>
#include <graphics.h>

#define U 72
#define L 75
#define D 80
#define R 77
#define ESC 27

int a[5][5], poly[17][8] = {{200, 150, 255, 150, 255, 205, 200, 205},
                            {255, 150, 310, 150, 310, 205, 255, 205},
                            {310, 150, 365, 150, 365, 205, 310, 205},
                            {365, 150, 420, 150, 420, 205, 365, 205},
                            {200, 205, 255, 205, 255, 260, 200, 260},
                            {255, 205, 310, 205, 310, 260, 255, 260},
                            {310, 205, 365, 205, 365, 260, 310, 260},
                            {365, 205, 420, 205, 420, 260, 365, 260},
                            {200, 260, 255, 260, 255, 315, 200, 315},
                            {255, 260, 310, 260, 310, 315, 255, 315},
                            {310, 260, 365, 260, 365, 315, 310, 315},
                            {365, 260, 420, 260, 420, 315, 365, 315},
                            {200, 315, 255, 315, 255, 370, 200, 370},
                            {255, 315, 310, 315, 310, 370, 255, 370},
                            {310, 315, 365, 315, 365, 370, 310, 370},
                            {365, 315, 420, 315, 420, 370, 365, 370}};

int idle, flag;
long int sc;
void beep(int, int);
void main()
{
    void init(), disp();
    int s, er, i, j, k, checkran(), check(), status(int);
    char c;
    flag = 1;
    goto jump;
re:
    flag = 0;
jump:
    sc = 0;
    clrscr();
    init();
    disp();
    flushall();
    getch();

    for (; c != ESC;)
    {
        idle = 0;
        c = getch();
        beep(3000, 20);
        switch (c)
        {
        case D:
            for (i = 0; i < 4; i++)
                for (j = 1; j < 4; j++)
                    if (a[j][i] == 0)
                        for (k = j; k > 0; k--)
                        {
                            if (a[k - 1][i] != 0)
                                idle++;
                            a[k][i] = a[k - 1][i];
                            a[k - 1][i] = 0;
                        }
            for (i = 0; i < 4; i++)
                for (j = 3; j > 0; j--)
                    if (a[j][i] == a[j - 1][i])
                    {
                        if (a[j][i])
                            idle++;
                        a[j][i] *= 2;
                        sc += a[j][i];
                        for (k = j; k > 0; k--)
                            a[k - 1][i] = a[k - 2][i];
                        a[0][i] = 0;
                    }
            er = checkran();
            disp();
            switch (er)
            {
            case -1:
                if (status(-1) == 1)
                    goto re;
                break;
            case 1:
                if (status(1) == 2)
                    goto re;
                break;
            case 0:
                er = check();
                break;
            }
            if (er == -1 && status(-1) == 1)
                goto re;
            break;

        case U:
            for (i = 0; i < 4; i++)
                for (j = 2; j >= 0; j--)
                    if (a[j][i] == 0)
                        for (k = j; k < 3; k++)
                        {
                            if (a[k + 1][i] != 0)
                                idle++;
                            a[k][i] = a[k + 1][i];
                            a[k + 1][i] = 0;
                        }
            for (i = 0; i < 4; i++)
                for (j = 0; j < 3; j++)
                    if (a[j][i] == a[j + 1][i])
                    {
                        if (a[j][i])
                            idle++;
                        a[j][i] *= 2;
                        sc += a[j][i];
                        for (k = j; k < 3; k++)
                            a[k + 1][i] = a[k + 2][i];
                        a[3][i] = 0;
                    }
            er = checkran();
            disp();
            switch (er)
            {
            case -1:
                if (status(-1) == 1)
                    goto re;
                break;
            case 1:
                if (status(1) == 2)
                    goto re;
                break;
            case 0:
                er = check();
                break;
            }
            if (er == -1 && status(-1) == 1)
                goto re;
            break;

        case R:
            for (i = 0; i < 4; i++)
                for (j = 1; j < 4; j++)
                    if (a[i][j] == 0)
                        for (k = j; k > 0; k--)
                        {
                            if (a[i][k - 1] != 0)
                                idle++;
                            a[i][k] = a[i][k - 1];
                            a[i][k - 1] = 0;
                        }
            for (i = 0; i < 4; i++)
                for (j = 3; j > 0; j--)
                    if (a[i][j] == a[i][j - 1])
                    {
                        if (a[i][j])
                            idle++;
                        a[i][j] *= 2;
                        sc += a[i][j];
                        for (k = j; k > 0; k--)
                            a[i][k - 1] = a[i][k - 2];
                        a[i][0] = 0;
                    }
            er = checkran();
            disp();
            switch (er)
            {
            case -1:
                if (status(-1) == 1)
                    goto re;
                break;
            case 1:
                if (status(1) == 2)
                    goto re;
                break;
            case 0:
                er = check();
                break;
            }
            if (er == -1 && status(-1) == 1)
                goto re;
            break;

        case L:
            for (i = 0; i < 4; i++)
                for (j = 2; j >= 0; j--)
                    if (a[i][j] == 0)
                        for (k = j; k < 3; k++)
                        {
                            if (a[i][k + 1] != 0)
                                idle++;
                            a[i][k] = a[i][k + 1];
                            a[i][k + 1] = 0;
                        }
            for (i = 0; i < 4; i++)
                for (j = 0; j < 3; j++)
                    if (a[i][j] == a[i][j + 1])
                    {
                        if (a[i][j])
                            idle++;
                        a[i][j] *= 2;
                        sc += a[i][j];
                        for (k = j; k < 3; k++)
                            a[i][k + 1] = a[i][k + 2];
                        a[i][3] = 0;
                    }
            er = checkran();
            disp();
            switch (er)
            {
            case -1:
                if (status(-1) == 1)
                    goto re;
                break;
            case 1:
                if (status(1) == 2)
                    goto re;
                break;
            case 0:
                er = check();
                break;
            }
            if (er == -1 && status(-1) == 1)
                goto re;
            break;
        }
    }
}
int check(void)
{
    int i, j;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            if (a[i][j] == a[i][j + 1] || a[i][j] == a[i + 1][j] || a[i][j] == 0)
                return 1;
    return -1;
}
int checkran(void)
{
    int i, j, k;
    if (idle == 0)
        return 0;
    for (i = 0; (i < 4 && (flag == 1 || flag == 0)); i++)
        for (j = 0; j < 4; j++)
            if (a[i][j] == 2048)
            {
                flag = -1;
                return 1;
            }
    randomize();
    if (random(100) % 2 == 0)
    {
        for (i = 0; i < 4; i++)
            for (j = 0; j < 4; j++)
                if (a[i][j] == 0)
                {
                    a[i][j] = 2;
                    return 0;
                }
    }
    else
    {
        for (i = 3; i >= 0; i--)
            for (j = 3; j >= 0; j--)
                if (a[i][j] == 0)
                {
                    a[i][j] = 4;
                    return 0;
                }
    }
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            if (a[i][j] == a[i][j + 1] || a[i][j] == a[i + 1][j])
                return 0;
    return -1;
}

void disp(void)
{
    int i, j, k, x, y, b[8] = {205, 410, 415, 410, 415, 445, 205, 445};
    char buf[] = "blah!", BUF[] = "BLAH!";
    for (k = 0, y = 160, i = 0; i < 4; i++, y += 56)
        for (x = 212, j = 0; j < 4; j++, x += 56)
        {
            switch (a[i][j])
            {
            case 0:
                setfillstyle(1, 0);
                break;
            case 2:
                setfillstyle(1, 7);
                break;
            case 4:
                setfillstyle(1, 3);
                break;
            case 8:
                setfillstyle(1, 2);
                break;
            case 16:
                setfillstyle(1, 9);
                break;
            case 32:
                setfillstyle(1, 13);
                break;
            case 64:
                setfillstyle(1, 5);
                break;
            case 128:
                setfillstyle(1, 1);
                break;
            case 256:
                setfillstyle(1, 12);
                break;
            case 512:
                setfillstyle(1, 4);
                break;
            case 1024:
                setfillstyle(1, 6);
                break;
            case 2048:
                setfillstyle(1, 14);
                break;
            case 4096:
                setfillstyle(1, 8);
                break;
            case 8192:
                setfillstyle(1, 0);
                break;
            case 16384:
                setfillstyle(1, 15);
                break;
            }
            fillpoly(4, poly[k++]);
            setfillstyle(1, 14);
            fillpoly(4, b);
            setcolor(BLACK);
            settextstyle(2, 0, 6);
            outtextxy(250, 417, "SCORE = ");
            sprintf(BUF, "  %ld", sc);
            outtextxy(320, 417, BUF);
            settextstyle(1, 0, 1);
            setlinestyle(0, 0, 3);
            setcolor(WHITE);
            if (a[i][j] != 0)
            {
                sprintf(buf, "%d", a[i][j]);
                if (a[i][j] < 10)
                    outtextxy(x + 9, y + 3, buf);
                else if (a[i][j] < 100)
                    outtextxy(x + 3, y + 3, buf);
                else if (a[i][j] < 1000)
                    outtextxy(x - 3, y + 3, buf);
                else if (a[i][j] < 10000)
                    outtextxy(x - 9, y + 3, buf);
                else
                    outtextxy(x - 14, y + 3, buf);
            }
        }
}

void beep(int s, int d)
{
    sound(s);
    delay(d);
    nosound();
}

void init(void)
{
    int gd, gm, er, i, j, x, y;
    int b[8] = {200, 150, 420, 150, 420, 370, 200, 370};
    gd = DETECT;
    gm = DETECT; /* Request auto-detection	*/
    initgraph(&gd, &gm, "");
    er = graphresult(); /* Read result of initialization*/
    if (er != grOk)
    { /* Error occured during init	*/
        printf(" Graphics System Error: %s\n", grapherrormsg(er));
        getch();
        abort();
    }
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
            if (j == 4 || i == 4)
                a[i][j] = 1;
            else
                a[i][j] = 0;
    randomize();
    if (random(1398) % 2 == 0)
    {
        a[2][0] = 2;
        a[3][1] = 2;
    }
    else if (random(485) % 3 == 0)
    {
        a[1][1] = 4;
        a[0][3] = 2;
    }
    else if (random(782) % 2 != 0)
    {
        a[0][0] = 2;
        a[1][3] = 2;
    }
    else
    {
        a[0][2] = 2;
        a[2][2] = 4;
    }
    setlinestyle(0, 0, 3);
    rectangle(1, 1, getmaxx() - 1, getmaxy() - 1);
    rectangle(3, 3, getmaxx() - 3, getmaxy() - 3);
    rectangle(5, 5, getmaxx() - 5, getmaxy() - 5);
    setcolor(14);
    if (flag == 1)
    {
        settextstyle(0, 0, 7);
        setfillstyle(1, RED);
        fillpoly(4, b);
        outtextxy(205, 170, "2048");
        settextstyle(0, 0, 1);
        outtextxy(235, 275, "HIT ENTER TO START!!");
        outtextxy(265, 330, "From Divins");
        while (getch() != 13)
            ;
        settextstyle(0, 0, 7);
        for (x = 205, y = 170; y > 26; y--)
            outtextxy(x, y, "2048");
        clearviewport();
    }
    setcolor(RED);
    rectangle(1, 1, getmaxx() - 1, getmaxy() - 1);
    rectangle(3, 3, getmaxx() - 3, getmaxy() - 3);
    rectangle(5, 5, getmaxx() - 5, getmaxy() - 5);
    setcolor(14);
    settextstyle(0, 0, 7);
    outtextxy(206, 27, "2048");
    setfillstyle(1, 0);
    setcolor(WHITE);
    for (i = 0; i < 16; i++)
        fillpoly(4, poly[i]);
}

int status(int sta)
{
    int s, con;
    int b[8] = {205, 90, 415, 90, 415, 135, 205, 135};
    int c[8] = {165, 90, 455, 90, 455, 135, 165, 135};
    int d[8] = {163, 88, 457, 88, 457, 137, 163, 137};
    char o;
    settextstyle(2, 0, 5);
    setfillstyle(1, 4);
    switch (sta)
    {
    case -1:
        flag = 0;
        fillpoly(4, b);
        outtextxy(212, 100, " YOU LOSE. RETRY?: YES NO");
        line(360, 120, 381, 120);
        beep(600, 125);
        beep(500, 125);
        beep(400, 125);
        beep(300, 329);
        for (con = 1;;)
        {
            o = getch();
            switch (o)
            {
            case L:
                beep(3000, 20);
                con = 1;
                fillpoly(4, b);
                outtextxy(212, 100, " YOU LOSE. RETRY?: YES NO");
                line(360, 120, 381, 120);
                break;

            case R:
                beep(3000, 20);
                con = -1;
                fillpoly(4, b);
                outtextxy(212, 100, " YOU LOSE. RETRY?: YES NO");
                line(390, 120, 405, 120);
                break;

            case 13:
                beep(1000, 30);
                beep(900, 30);
                if (con != 1)
                    exit(0);
                else
                    return con;
            }
        }
    case 1:
        fillpoly(4, c);
        outtextxy(169, 102, "BRAVO..WELL DONE: CONTINUE RETRY EXIT");
        line(304, 121, 365, 121);
        beep(300, 130);
        beep(400, 132);
        beep(500, 130);
        beep(600, 281);
        for (con = 1, s = 1;;)
        {
            o = getch();
            switch (o)
            {
            case R:
                beep(3000, 20);
                if (s != 3)
                    s++;
                break;
            case L:
                beep(3000, 20);
                if (s != 1)
                    s--;
                break;
            case 13:
                beep(1000, 30);
                beep(900, 30);
                if (s == 3)
                    exit(0);
                else if (s == 1)
                {
                    setlinestyle(0, 0, 6);
                    setcolor(0);
                    setfillstyle(1, 0);
                    fillpoly(4, d);
                    return con;
                }
                else
                {
                    flag = 0;
                    return con;
                }
            }
            switch (s)
            {
            case 1:
                con = 1;
                fillpoly(4, c);
                outtextxy(169, 102, "BRAVO..WELL DONE: CONTINUE RETRY EXIT");
                line(304, 121, 365, 121);
                break;

            case 2:
                con = 2;
                fillpoly(4, c);
                outtextxy(169, 102, "BRAVO..WELL DONE: CONTINUE RETRY EXIT");
                line(374, 121, 412, 121);
                break;

            case 3:
                fillpoly(4, c);
                outtextxy(169, 102, "BRAVO..WELL DONE: CONTINUE RETRY EXIT");
                line(421, 121, 450, 121);
                break;
            }
        }
    }
    return 999; // Never mind....
}