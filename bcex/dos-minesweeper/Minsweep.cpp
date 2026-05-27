/**
 * author: Vahid Mavaji
 * Year: 2000
 */

#include<iostream.h>
#include<conio.h>
#include<graphics.h>
#include<stdlib.h>
#include<time.h>
#include"key.h"
#include"mouse.h"

class key : public keyBase {
public:
    key() {
        Flag = 0;
        Bomb = 0;
        rClick = ' ';
    }

    void showBomb();

    void setBomb(int i) { Bomb = i; }

    void setFlag(int i) { Flag = i; }

    void setrClick(char ch) { rClick = ch; }

    void drawFind(char);

    void Find(key *, int, int, int);

    int getBomb() { return Bomb; }

    int getFlag() { return Flag; }

    char getrClick() { return rClick; }

private:
    int Bomb;
    int Flag;
    char rClick;
};

void key::showBomb() {
    char *s = "";
    settextjustify(CENTER_TEXT, CENTER_TEXT);
    setcolor(Bomb + 8);

    settextstyle(2, 0, 4);
    gcvt(Bomb, 2, s);
    outtextxy((x1 + x2) / 2, (y1 + y2) / 2, s);
}

void key::drawFind(char ch) {
    setfillstyle(1, Color);
    bar(x1 - 1, y1 - 1, x2 + 1, y2 + 1);
    setlinestyle(DOTTED_LINE, 16, 1);
    setcolor(Color + 3);
    rectangle(x1, y1, x2, y2);
    setlinestyle(DOTTED_LINE, 16, 1);

    settextjustify(CENTER_TEXT, CENTER_TEXT);
    setcolor(15);
    settextstyle(2, 0, 4);
    char *s = "";
    s[0] = ch;
    s[1] = '\0';
    outtextxy((x1 + x2) / 2, (y1 + y2) / 2, s);
}

void Find(key *p, int index, int col, int line) {
    p->setFlag(1);

    int x, y;
    key *pKey = new key;
    if (p->getBomb() != 0) {
        p->drawFind(' ');
        p->showBomb();

        delete pKey;
        return;
    } else {
        p->drawFind(' ');
        y = (index + 1) / col;
        x = (index) % col;
        if (x > 0 && y > 0) {
            pKey = p - col - 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index - col - 1, col, line);
            }
        }
        if (y > 0) {
            pKey = p - col;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index - col, col, line);
            }
        }
        if (x < col - 1 && y > 0) {
            pKey = p - col + 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index - col + 1, col, line);
            }
        }
        if (x > 0) {
            pKey = p - 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index - 1, col, line);
            }
        }
        if (x < col - 1) {
            pKey = p + 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index + 1, col, line);
            }
        }
        if (x > 0 && y < line - 1) {
            pKey = p + col - 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index + col - 1, col, line);
            }
        }
        if (y < line - 1) {
            pKey = p + col;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index + col, col, line);
            }
        }
        if (x < col - 1 && y < line - 1) {
            pKey = p + col + 1;
            if (pKey->getFlag() == 0) {
                pKey->drawFind(' ');
                Find(pKey, index + col + 1, col, line);
            }
        }
    }//else
    return;
}

/*********************************************/
class minTable {
public:
    minTable() {}

    minTable(int, int, char);

    ~minTable();

    void Jack(char);

    void Draw();

    void show_vMins();

    void setMinsArray();

    void setMins(int i) {
        Mins = i;
        vMins = Mins;
    }

    void Play();

private:
    key *Keys;
    key Border[2];
    int Col, Line;
    int Mins, vMins;
    int *MinsArray;

    const int X1, Y1, Delta;
};

minTable::minTable(int col, int line, char color)
        : X1(100), Y1(50), Delta(15) {
    Col = col;
    Line = line;

    MinsArray = new int[Col * Line];

    Border[0].set(X1, Y1, X1 + Col * Delta + 14, Y1 + Line * Delta + 60 + 7);
    Border[0].setColor(color);

    Border[1].set(X1 + 5, Y1 + 5, X1 + Col * Delta + 14 - 5, Y1 + Line * Delta + 60 + 2);
    Border[1].setColor(color);

    Keys = new key[Col * Line];
    int i, j;
    int c = 0;

    for (j = 0; j < Line * Delta; j += Delta)
        for (i = 0; i < Col * Delta; i += Delta) {
            (Keys + c)->setColor(color);
            (Keys + c)->setx1(i + (X1 + 8));
            (Keys + c)->sety1(j + (Y1 + 60 + 2));
            (Keys + c)->setx2(i + Delta - 3 + (X1 + 8));
            (Keys + c)->sety2(j + Delta - 3 + (Y1 + 60 + 2));
            c++;
        }//for
}

minTable::~minTable() {
    delete[] Keys;
    delete[] MinsArray;
}

void minTable::setMinsArray() {
    time_t t;
    int i, j, minNum = 0;

    srand((unsigned) time(&t));
    for (i = 0; i < Col; i++)
        for (j = 0; j < Line; j++)
            if (random(10) > 5 && minNum < Mins) {
                *(MinsArray + j * Line + i) = 1;
                minNum++;
            } else *(MinsArray + j * Line + i) = 0;
    int index;
    int num;
    for (i = 0; i < Col; i++)
        for (j = 0; j < Line; j++) {
            index = j * Line + i;
            num = 0;
            (Keys + index)->setBomb(0);
            if (i > 0 && j > 0)
                num += *(MinsArray + index - Col - 1);

            if (j > 0)
                num += *(MinsArray + index - Col);

            if (i < Col - 1 && j > 0)
                num += *(MinsArray + index - Col + 1);

            if (i > 0)
                num += *(MinsArray + index - 1);

            if (i < Col - 1)
                num += *(MinsArray + index + 1);

            if (i > 0 && j < Line - 1)
                num += *(MinsArray + index + Col - 1);

            if (j < Line - 1)
                num += *(MinsArray + index + Col);

            if (i < Col - 1 && j < Line - 1)
                num += *(MinsArray + index + Col + 1);

            (Keys + index)->setBomb(num);
        }//for

}

void minTable::show_vMins() {
    keyBase vmins;
    int x, y;
    x = Border[1].getx1() + 10;
    y = Border[1].gety1() + 20;
    vmins.setx1(x);
    vmins.sety1(y);
    vmins.setx2(x + 30);
    vmins.sety2(y + 20);
    vmins.setColor(Border[0].getColor());
    vmins.draw(0);

    settextjustify(RIGHT_TEXT, CENTER_TEXT);
    settextstyle(2, 0, 4);
    setcolor(14);
    char *s = "";
    gcvt(vMins, 4, s);
    outtextxy(x + 30, y + 10, s);
}

void minTable::Jack(char choice) {
    int radius = 13;
    int x, y;
    keyBase jack;
    x = (Border[0].getx1() + Border[0].getx2()) / 2;
    y = (2 * Border[1].gety1() + 60) / 2;

    jack.setx1(x - radius);
    jack.sety1(y - radius);
    jack.setx2(x + radius);
    jack.sety2(y + radius);
    jack.setColor(1);
    jack.draw(1);
    setcolor(14);
    circle(x, y, radius - 2);
    circle(x - 5, y - 3, 2);
    circle(x + 5, y - 3, 2);
    switch (choice) {
        case 1:
            setlinestyle(SOLID_LINE, 16, 1);
            line(x - 5, y + 4, x + 5, y + 4);
            break;
        case 2:
            circle(x, y + 4, 3);
            break;
        case 3:
            arc(x, y + 5, 0, 180, 4);
            break;
        case 4:
            setfillstyle(1, 14);
            floodfill(x - 5, y - 3, 14);
            floodfill(x + 5, y - 3, 14);
            arc(x, y + 2, 180, 360, 4);
            break;
    }//case
}

void minTable::Draw() {
    Border[0].draw(1);
    Border[1].draw(0);

    int i;
    for (i = 0; i < Col * Line; i++)
        (Keys + i)->draw(1);
}

void minTable::Play() {
    mouseBase Mouse;
    int i, j;
    key *p;

    Mouse.init(Border[0].getx1(), Border[0].gety1());
    Mouse.seton();
    Mouse.horlimit(Border[0].getx1(), Border[0].getx2());
    Mouse.verlimit(Border[0].gety1(), Border[0].gety2());

    Jack(1);
    show_vMins();
    do {
        Mouse.click();
        if (Mouse.getBotton() == 1) {
            for (i = 0; i < Col * Line; i++) {
                p = (Keys + i);
                if (Mouse.getCol() >= p->getx1()
                    && Mouse.getCol() <= p->getx2()
                    && Mouse.getLine() >= p->gety1()
                    && Mouse.getLine() <= p->gety2()) {
                    if (*(MinsArray + i) == 1) {
                        Mouse.setoff();
                        for (int k = 0; k < Col * Line; k++)
                            if (*(MinsArray + k) == 1)
                                (Keys + k)->drawFind('\xE8');
                        Jack(3);
                        Mouse.seton();
                        return;
                    } else {
                        Jack(2);
                        Mouse.setoff();
                        Find(p, i, Col, Line);
                        Mouse.seton();
                        delay(50);
                        Jack(1);
                    }
                    break;
                }//if

            }//for
        }//if
        if (Mouse.getBotton() == 2) {
            Mouse.setoff();
            for (i = 0; i < Col * Line; i++) {
                p = (Keys + i);
                if (Mouse.getCol() >= p->getx1()
                    && Mouse.getCol() <= p->getx2()
                    && Mouse.getLine() >= p->gety1()
                    && Mouse.getLine() <= p->gety2()
                    && p->getFlag() == 0) {
                    switch (p->getrClick()) {
                        case 'B':
                            p->setrClick('?');
                            vMins++;
                            if (*(MinsArray + i) == 1) Mins++;
                            show_vMins();
                            break;
                        case '?':
                            p->setrClick(' ');
                            break;
                        case ' ':
                            p->setrClick('B');
                            vMins--;
                            if (*(MinsArray + i) == 1) Mins--;
                            show_vMins();

                            break;
                    }//case
                    p->draw(1);
                    settextjustify(CENTER_TEXT, CENTER_TEXT);
                    setcolor(15);
                    settextstyle(2, 0, 4);
                    char *s = "";
                    s[0] = p->getrClick();
                    s[1] = '\0';
                    outtextxy((p->getx1() + p->getx2()) / 2, (p->gety1() + p->gety2()) / 2, s);
                    break;
                }//if
            }//for

            delay(200);
            Mouse.seton();
            if (Mins == 0) {
                Jack(4);
                return;
            }
        }//if
    } while (1);

}

void main() {
    clrscr();
    int x, y, c, n;

    cout << "Enter columns & lines:";
    cin >> x >> y;
    cout << "Enter color & number of mines:";
    cin >> c >> n;
    minTable obj(x, y, c);
    int i = 0;
    initgraph(&i, &i, "c:\\borlandc\\bgi");
    obj.Draw();
    obj.setMins(n);
    obj.setMinsArray();
    obj.Play();
    getch();
    closegraph();
}