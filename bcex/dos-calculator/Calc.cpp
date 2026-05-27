/**
 * author: Vahid Mavaji
 * year: 2001
 */

#include<iostream.h>

#include<graphics.h>
#include<string.h>
#include<dos.h>
#include<stdlib.h>
#include<math.h>

class key {
public:
    void draw(int choice);

    inline void setcoor(int a, int b, int c, int d);

    inline void setname(char *s);

    inline void settag(char ch);

    int &getx1() { return x1; }

    int &getx2() { return x2; }

    int &gety1() { return y1; }

    int &gety2() { return y2; }

    char &gettag() { return tag; }

private:
    int x1, y1, x2, y2;
    char name[4];
    char tag;
};

void key::settag(char ch) {
    tag = ch;
}

void key::setcoor(int a, int b, int c, int d) {
    x1 = a;
    y1 = b;
    x2 = c;
    y2 = d;
}

void key::setname(char *s) {
    strcpy(name, s);
}


void key::draw(int choice) {
    int delta;
    delta = (choice == 1) ? 1 : -1;
    setfillstyle(1, 4);
    bar(x1, y1, x2, y2);
    if (choice == 1) setfillstyle(1, 12); else setfillstyle(1, 0);
    bar(x1 - delta, y1 - delta, x2, y1);
    bar(x1 - delta, y1 - delta, x1, y2);
    if (choice == 1) setfillstyle(1, 0); else setfillstyle(1, 12);
    bar(x1 - delta, y2 + delta, x2, y2);
    bar(x2 + delta, y2 + delta, x2, y1);

    settextjustify(CENTER_TEXT, CENTER_TEXT);
    int size = (choice == 1) ? 7 : 6;
    settextstyle(2, 0, size);
    setcolor(15);
    outtextxy((x1 + x2) / 2, (y1 + y2) / 2, name);
}


class calculator {
public:

    void calculate(char &ch);

    void show_curnum();

    inline void setcoor(int index, int a, int b, int c, int d);

    inline void setname(int index, char *s);

    inline void settag(int index, char ch);

    inline void draw(int index, int choice);


    int &getx1(int index) { return keys[index].getx1(); }

    int &getx2(int index) { return keys[index].getx2(); }

    int &gety1(int index) { return keys[index].gety1(); }

    int &gety2(int index) { return keys[index].gety2(); }

    char &gettag(int index) { return keys[index].gettag(); }

    void setmembers();

    friend void initialize(calculator &);

private:
    key keys[27];
    char sign;
    double temp, memory;
    char *curnum;
    char mem, err;
};

void calculator::setmembers() {
    sign = '\0';
    temp = 0;
    memory = 0;
    strcpy(curnum, "");
    mem = err = 0;
}

void calculator::setcoor(int index, int a, int b, int c, int d) {
    keys[index].setcoor(a, b, c, d);
}

void calculator::settag(int index, char ch) {
    keys[index].settag(ch);
}

void calculator::setname(int index, char *s) {
    keys[index].setname(s);
}

void calculator::draw(int index, int choice) {
    keys[index].draw(choice);
}

void calculator::show_curnum() {
    int coor;
    setfillstyle(1, 2);
    bar(getx1(1) + 2, gety1(1) + 2, getx2(1) - 2, gety2(1) - 2);
    coor = getx2(1);
    settextjustify(LEFT_TEXT, CENTER_TEXT);
    setcolor(10);
    settextstyle(5, 0, 1);
    outtextxy(coor - textwidth(curnum), (gety1(1) + gety2(1)) / 2, curnum);

    settextstyle(2, 0, 5);
    setcolor(4);


    if (mem == 1) outtextxy(190, 60, "M");
    if (err == 1) outtextxy(190, 80, "E");

    char *s = "";
    s[0] = sign;
    s[1] = '\0';
    outtextxy(190, 70, s);
}

void calculator::calculate(char &ch) {

    static char fpoint = 0;
    static char flag = 0, m_flag = 0;

    double num;
    int n;
    if (err == 0)
        switch (ch) {
            case '.':
                if (fpoint == 1) break;
                else fpoint = 1;
            case '0':;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                if (m_flag == 1) {
                    strcpy(curnum, "");
                    m_flag = 0;
                }
                if (flag == 1) {
                    strcpy(curnum, "");
                    flag = 0;
                }
                if (strlen(curnum) < 10) {
                    n = strlen(curnum);
                    curnum[n] = ch;
                    curnum[n + 1] = '\0';
                }
                break;

            case 'I':
            case 'D':
                mem = 1;
            case '=':
            case '+':
            case '-':
            case '*':
            case '\xF6':
                num = atof(curnum);
                if (flag != 1)
                    switch (sign) {
                        case '+':
                            temp += num;
                            break;
                        case '-':
                            temp -= num;
                            break;
                        case '*':
                            temp *= num;
                            break;
                        case '\xF6':
                            if (num == 0) {
                                err = 1;
                                break;
                            }
                            temp /= num;
                            break;
                        default :
                            temp = num;
                            break;
                    }//case
                gcvt(temp, 10, curnum);
                fpoint = 0;
                if (ch == '=' || ch == 'I' || ch == 'D')sign = '\0'; else sign = ch;
                if (ch == 'I')
                    memory += temp;
                else if (ch == 'D')memory -= temp;
                if (memory == 0) mem = 0;
                flag = 1;

                break;

            case 'R':
                num = memory;

                gcvt(num, 10, curnum);
                if (flag == 1) flag = 0;
                m_flag = 1;
                break;

            case 'S':
                num = atof(curnum);
                if (num < 0) {
                    err = 1;
                    break;
                }
                setmembers();
                temp = sqrt(num);
                gcvt(temp, 10, curnum);
                break;

            case 'N':
                num = atof(curnum);
                num = -num;
                if (flag == 1)temp = -temp;
                gcvt(num, 10, curnum);
                break;
        }//case
    switch (ch) {
        case 'C':
            if (err == 0) strcpy(curnum, "");
            fpoint = 0;
            err = 0;
            break;
        case 'A':
            setmembers();
            fpoint = 0;
            err = 0;
            break;
    }

}


class mouse {
public:
    void init() {
        r.x.ax = 0;
        int86(0x33, &r, &r);
        r.x.ax = 4;
        r.x.cx = 150;
        r.x.dx = 20;
        int86(0x33, &r, &r);
    }

    void seton() {
        r.x.ax = 1;
        int86(0x33, &r, &r);
    }

    void setoff() {
        r.x.ax = 2;
        int86(0x33, &r, &r);
    }

    void horlimit(int left, int right);

    void verlimit(int up, int down);

    void click();

    void check(calculator &calobj);

private:
    union REGS r;
    int col, line, botton;

};

void mouse::horlimit(int left, int right) {
    r.x.ax = 7;
    r.x.cx = left;
    r.x.dx = right;
    int86(0x33, &r, &r);
}

void mouse::verlimit(int up, int down) {
    r.x.ax = 8;
    r.x.cx = up;
    r.x.dx = down;
    int86(0x33, &r, &r);
}

void mouse::click() {
    r.x.ax = 3;
    int86(0x33, &r, &r);
    col = r.x.cx;
    line = r.x.dx;
    botton = r.x.bx;

}

void mouse::check(calculator &calobj) {
    int i;

    init();
    seton();
    horlimit(150, 450);
    verlimit(20, 400);
    calobj.show_curnum();

    while (1) {
        click();

        if (botton == 1) {

            for (i = 2; i <= 26; i++) {

                if (col >= calobj.getx1(i) && col <= calobj.getx2(i) && line >= calobj.gety1(i) &&
                    line <= calobj.gety2(i)) {
                    setoff();
                    calobj.draw(i, 0);
                    delay(50);
                    calobj.draw(i, 1);
                    if (calobj.gettag(i) == '\0') { return; }
                    calobj.calculate(calobj.gettag(i));
                    calobj.show_curnum();
                    seton();
                    break;
                }//if
            }//for
            delay(200);
        }//if


    }//while
}


void initialize(calculator &calobj) {
    char *list[27] = {"\xAE", "MR", "M-", "M+", "\xAF",
                      "\xFB", "7", "8", "9", "\xF6",
                      "\xF1", "4", "5", "6", "*",
                      "C", "1", "2", "3", "-",
                      "AC", ".", "0", "=", "+"};

    char taglist[27] = {'\0', 'R', 'D', 'I', '\0',
                        'S', '7', '8', '9', '\xF6',
                        'N', '4', '5', '6', '*',
                        'C', '1', '2', '3', '-',
                        'A', '.', '0', '=', '+'};


    calobj.setcoor(0, 150, 20, 450, 400);
    calobj.setname(0, "");
    calobj.settag(0, '\0');
    calobj.draw(0, 1);

    calobj.setcoor(1, 180, 50, 420, 90);
    calobj.setname(1, "");
    calobj.settag(1, '\0');
    calobj.draw(1, 0);

    int i, j;
    int c = 2;
    for (j = 140; j <= 340; j += 50)
        for (i = 180; i <= 380; i += 50) {
            calobj.setcoor(c, i, j, i + 40, j + 40);
            calobj.setname(c, list[c - 2]);
            calobj.settag(c, taglist[c - 2]);
            calobj.draw(c, 1);
            c++;
        }
    calobj.setmembers();
}


void comment() {
    key comment;
    comment.setcoor(50, 20, 65, 400);
    comment.setname("");
    comment.draw(1);
    settextstyle(2, 1, 4);
    setcolor(15);
    outtextxy(52, 210, "Taak Calculator ***** Written By Vahid Mavvaji.9 May 2001");
}


void main() {
    int i = 0;
    calculator cal1;
    mouse mouse1;

    initgraph(&i, &i, "c:\\borlandc\\bgi");
    setbkcolor(0);
    system("c:\\gmouse.com");
    initialize(cal1);
    comment();
    mouse1.check(cal1);

    closegraph();
}