/*
  Name: Gourav Siddhad
  Date: 08/10/13 22:29
  Description: teacher header for student teacher management system
*/

#ifndef TEACHER_H
#define TEACHER_H

using namespace std;

class teacher
{
protected:
    char name[20];
    char address[20];
    char qualification[20];

public:
    teacher();
    teacher(char[], char[], char[]);
};

class pteacher : public teacher
{
protected:
public:
    pteacher();
};

class gteacher : public teacher
{
protected:
public:
    gteacher();
};

teacher::teacher()
{
    strcpy(name, "");
    strcpy(address, "");
    strcpy(qualification, "");
}

teacher::teacher(char na[], char add[], char qual[])
{
    strcpy(name, na);
    strcpy(address, add);
    strcpy(qualification, qual);
}

pteacher::pteacher()
{
}

gteacher::gteacher()
{
}

#endif
