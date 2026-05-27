/**
 * author: Vahid Mavaji
 * Year: 2000
 */

#include<conio.h>
#include<graphics.h>
#include<stdlib.h>
#include<stdio.h>
#include<dos.h>

int a[8][8] = {0};
int b[8][8] = {0};
char cor[60][60] = {0};

void demo();

void demox(char *s, int x, int top, int bottom, int font, int size);

void write(char *s, int x, int top, int bottom, int font, int size);

void key(int x1, int y1, int x2, int y2, int delta, int choice);

void seta();

void deca(int i, int j);

void mine(int i, int j, int *p, int *q);

void chess();

void load();

void draw(int i, int j);

void main() {
    int i = 0, j = 0, d = 0;
    int oldi, oldj;
    int t = 0;
    char *s;
    clrscr();
    initgraph(&d, &d, "c:\\borlandc\\bgi");
    demo();

    closegraph();
    printf("Enter First Position(x,y):");
    scanf("%d %d", &i, &j);
    i--;
    j--;
    d = 0;
    initgraph(&d, &d, "c:\\borlandc\\bgi");

    chess();
    load();
    seta();
    settextstyle(4, 0, 5);
    while (t < 64 && getch() != 'e') {
        b[i][j] = 1;
        t++;
        itoa(t, s, 10);
        setfillstyle(1, 0);
        bar(10, 10, 70, 70);

        outtextxy(10, 10, s);
        draw(i * 50 + 100, j * 50 + 60);

        oldi = i;
        oldj = j;
        mine(oldi, oldj, &i, &j);
        deca(oldi, oldj);


        //getch();
    }
    getch();
    closegraph();
}

void seta() {
    int i, j, c = 0;
    for (i = 0; i < 8; i++)
        for (j = 0; j < 8; j++) {
            c = 0;
            if (i + 2 <= 7 && j - 1 >= 0) c++;
            if (i + 1 <= 7 && j - 2 >= 0) c++;
            if (i - 1 >= 0 && j - 2 >= 0) c++;
            if (i - 2 >= 0 && j - 1 >= 0) c++;
            if (i - 2 >= 0 && j + 1 <= 7) c++;
            if (i - 1 >= 0 && j + 2 <= 7) c++;
            if (i + 1 <= 7 && j + 2 <= 7) c++;
            if (i + 2 <= 7 && j + 1 <= 7) c++;
            a[i][j] = c;
        }
}

void mine(int i, int j, int *p, int *q) {
    int min = 10;

    if (i + 2 <= 7 && j - 1 >= 0 && b[i + 2][j - 1] != 1)
        if (a[i + 2][j - 1] < min) {
            min = a[i + 2][j - 1];
            *p = i + 2;
            *q = j - 1;
        }

    if (i + 1 <= 7 && j - 2 >= 0 && b[i + 1][j - 2] != 1)
        if (a[i + 1][j - 2] < min) {
            min = a[i + 1][j - 2];
            *p = i + 1;
            *q = j - 2;
        }

    if (i - 1 >= 0 && j - 2 >= 0 && b[i - 1][j - 2] != 1)
        if (a[i - 1][j - 2] < min) {
            min = a[i - 1][j - 2];
            *p = i - 1;
            *q = j - 2;
        }

    if (i - 2 >= 0 && j - 1 >= 0 && b[i - 2][j - 1] != 1)
        if (a[i - 2][j - 1] < min) {
            min = a[i - 2][j - 1];
            *p = i - 2;
            *q = j - 1;
        }

    if (i - 2 >= 0 && j + 1 <= 7 && b[i - 2][j + 1] != 1)
        if (a[i - 2][j + 1] < min) {
            min = a[i - 2][j + 1];
            *p = i - 2;
            *q = j + 1;
        }

    if (i - 1 >= 0 && j + 2 <= 7 && b[i - 1][j + 2] != 1)
        if (a[i - 1][j + 2] < min) {
            min = a[i - 1][j + 2];
            *p = i - 1;
            *q = j + 2;
        }

    if (i + 1 <= 7 && j + 2 <= 7 && b[i + 1][j + 2] != 1)
        if (a[i + 1][j + 2] < min) {
            min = a[i + 1][j + 2];
            *p = i + 1;
            *q = j + 2;
        }

    if (i + 2 <= 7 && j + 1 <= 7 && b[i + 2][j + 1] != 1)
        if (a[i + 2][j + 1] < min) {
            min = a[i + 2][j + 1];
            *p = i + 2;
            *q = j + 1;
        }
}

void deca(int i, int j) {

    if (i + 2 <= 7 && j - 1 >= 0) a[i + 2][j - 1]--;
    if (i + 1 <= 7 && j - 2 >= 0) a[i + 1][j - 2]--;
    if (i - 1 >= 0 && j - 2 >= 0) a[i - 1][j - 2]--;
    if (i - 2 >= 0 && j - 1 >= 0) a[i - 2][j - 1]--;
    if (i - 2 >= 0 && j + 1 <= 7) a[i - 2][j + 1]--;
    if (i - 1 >= 0 && j + 2 <= 7) a[i - 1][j + 2]--;
    if (i + 1 <= 7 && j + 2 <= 7) a[i + 1][j + 2]--;
    if (i + 2 <= 7 && j + 1 <= 7) a[i + 2][j + 1]--;
}

void load() {

    FILE *fp;
    fp = fopen("queen", "r+");

    rewind(fp);
    fread(cor, 3600, 1, fp);
}

void chess() {
    int i, j, choice;
    setbkcolor(7);
    for (i = 100; i < 450; i += 49)
        for (j = 60; j < 410; j += 49) {
            if ((i + j) % 2 == 0) choice = 1; else choice = 0;
            key(i, j, i + 49, j + 49, 1, choice);

        }
}

void draw(int i, int j) {
    int k, l, color;
    for (k = 2; k < 40; k++)
        for (l = 2; l < 40; l++) {
            color = cor[k][l];
            if (color == 0) color = getpixel(i + k, j + l);
            putpixel(i + k, j + l, color);
        }
}

void key(int x1, int y1, int x2, int y2, int delta, int choice) {
    int c;
    if (choice == 1)c = delta; else c = -delta;
    setfillstyle(1, 7);
    bar(x1, y1, x2, y2);
    if (choice)setfillstyle(1, 15); else setfillstyle(1, 8);
    bar(x1 - c, y1 - c, x1, y2);
    bar(x1, y1 - c, x2 + c, y1);
    if (choice)setfillstyle(1, 8); else setfillstyle(1, 15);
    bar(x1 - c, y2, x2, y2 + c);
    bar(x2, y1, x2 + c, y2 + c);
}

void write(char *s, int x, int top, int bottom, int font, int size) {
    int i, j;
    settextstyle(font, 0, size);
    if (top < bottom)
        for (i = top; i <= bottom; i += 3) {
            setcolor(8);
            outtextxy(x + 5, i + 5, s);
            setcolor(15);
            outtextxy(x, i, s);
            delay(5);
            setcolor(7);
            outtextxy(x + 5, i + 5, s);
            outtextxy(x, i, s);
        }
    else
        for (i = top; i >= bottom; i -= 3) {
            setcolor(8);
            outtextxy(x + 5, i + 5, s);
            setcolor(15);
            outtextxy(x, i, s);
            delay(5);
            setcolor(7);
            outtextxy(x, i, s);
            outtextxy(x + 5, i + 5, s);
        }

}

void demox(char *s, int x, int top, int bottom, int font, int size) {
    int x1;
    x1 = bottom - top;
    while (x1 > 0) {
        write(s, x, bottom - x1, bottom, font, size);
        x1 /= 2;
        write(s, x, bottom, bottom - x1, font, size);
    }
}

void demo() {
    setbkcolor(7);
    demox("VAHID", 50, 50, 150, 3, 8);
    demox("MAVVAJI", 250, 50, 150, 3, 8);
    demox("<<presents>>", 150, 200, 250, 3, 5);
}

