#ifndef PERSON_H
#define PERSON_H

#include "iostream"
#include "fstream"
#define SIZE 20
using namespace std;

class person
{
protected:
    int dd, dm, dy;
    char name[SIZE];
    char add[SIZE];
    char inst[SIZE];

public:
    virtual void getdata() = 0;
    virtual void display() = 0;
};

class teacher : public person
{
protected:
    int eno;
    float pay;
    int exp;

public:
    int geteno();
    void getdata();
    void display();
};

class student : public person
{
protected:
    int rno;
    int marks;
    int stnd;

public:
    int getroll();
    void getdata();
    void display();
};

void person ::getdata()
{
    cout << "\n Enter Name : ";
    fflush(stdin);
    gets(name);
    cout << " Enter Address : ";
    fflush(stdin);
    gets(add);
    cout << " Enter Institute : ";
    fflush(stdin);
    gets(inst);
    cout << " Enter Date Of Birth (dd mm yyyy) : ";
    cin >> dd >> dm >> dy;
}

void person ::display()
{
    cout << "\n Name : " << name;
    fflush(stdout);
    cout << "\n Address : " < add;
    cout << "\n Institute : " << inst;
    cout << "\n Date Of Birth : " << dd << "/" << dm << "/" << dy;
}

void teacher ::getdata()
{
    person::getdata();
    cout << " Enter Employee Number : ";
    cin >> eno;
    cout << " Enter Salary : ";
    cin >> pay;
    cout << " Enter Experience : ";
    cin >> exp;
}

void teacher ::display()
{
    person::display();
    cout << "\n Employee Number : " << eno;
    cout << "\n Salary : " << pay;
    cout << "\n Experience : " << exp;
}

int teacher ::geteno()
{
    return eno;
}

int student ::getroll()
{
    return rno;
}

void student ::getdata()
{
    person::getdata();
    cout << " Enter Roll No : ";
    cin >> rno;
    cout << " Enter Marks (Out Of 500) : ";
    cin >> marks;
    cout << " Enter Standard : ";
    cin >> stnd;
}

void student ::display()
{
    person::display();
    cout << "\n Roll No : " << rno;
    cout << "\n Marks (Out Of 500) : " << marks;
    cout << "\n Standard : " << stnd;
}

#endif
