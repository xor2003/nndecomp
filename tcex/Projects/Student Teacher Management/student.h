/*
  Name: Gourav Siddhad
  Date: 08/10/13 22:29
  Description: student header for student teacher management system
*/

#ifndef STUDENT_H
#define STUDENT_H

#define SIZE 20
using namespace std;

void sgetdata(char[], long &, char[], int &);
void performancesheet();
void ssortdata();

class student
{
protected:
    char name[20];
    char grade;
    long rollno;
    char course[20];
    int marks;
    void assigngrade();

public:
    student();
    student(char[], long &, char[], int &);
    void getdata();
    long getroll();
    char getgrade();
    int getmarks();
    void displayrecord();
    int operator==(const student &);
};

student::student()
{
    strcpy(name, "");
    rollno = 0;
    grade = 'F';
    strcpy(course, "");
    marks = 0;
}

student::student(char na[], long &roll, char cour[], int &mark)
{
    strcpy(name, na);
    rollno = roll;
    strcpy(course, cour);
    marks = mark;
    assigngrade();
}

void student::getdata()
{
    cout << "\n\n Enter Name\t";
    fflush(stdin);
    gets(name);
    cout << " Enter Roll No.\t";
    cin >> rollno;
    cout << " Enter Course \t";
    fflush(stdin);
    gets(course);
    cout << " Enter Marks \t";
    cin >> marks;
    assigngrade();
}

long student::getroll()
{
    return rollno;
}

char student::getgrade()
{
    return grade;
}

void student::assigngrade()
{
    if (marks < 50)
        grade = 'F';
    else if (marks >= 50 && marks < 60)
        grade = 'D';
    else if (marks >= 60 && marks < 75)
        grade = 'C';
    else if (marks >= 75 && marks < 90)
        grade = 'B';
    else if (marks >= 90 && marks <= 100)
        grade = 'A';
}

int student::getmarks()
{
    return marks;
}

void student::displayrecord()
{
    cout << "\n Name : \t" << name;
    cout << "\n Roll No. : \t" << rollno;
    cout << "\n Course : \t" << course;
    cout << "\n Marks : \t" << marks;
    cout << "\n Grade : \t" << grade;
}

int student::operator==(const student &s)
{
    return 1;
}

void sgetdata(char na[], long &roll, char cour[], int &mark)
{
    cout << "\n\n Enter Name\t";
    fflush(stdin);
    gets(na);
    cout << " Enter Roll No.\t";
    cin >> roll;
    cout << " Enter Course \t";
    fflush(stdin);
    gets(cour);
    cout << " Enter Marks \t";
    cin >> mark;
}

void performancesheet()
{
    cout << endl;
    student st;
    ifstream ifile("student.dat", ios::binary);
    while (ifile.read((char *)&st, sizeof(st)))
    {
        cout << endl
             << st.getroll();
        cout << "\t" << st.getgrade();
    }
    ifile.close();
}

void ssortdata()
{
    int i = 0, roll[SIZE];
    student st;
    ofstream ofile;
    ifstream ifile;

    ifile.open("student.dat", ios::binary);
    while (ifile.read((char *)&st, sizeof(st)))
    {
        roll[i] = st.getroll();
        i++;
    }
    ifile.close();

    int n = i, l, temp, min;
    for (int j = 0; j < n - 1; j++)
    {
        min = roll[j];
        for (int k = j + 1; k < n; k++)
            if (roll[k] < min)
            {
                l = k;
                min = roll[k];
            }
        temp = roll[j];
        roll[j] = min;
        roll[l] = temp;
    }

    int flag = 0;
    ifstream file;
    file.open("student.dat", ios::binary);
    ofile.open("temp.dat", ios::binary);
    for (int j = 0; j < n; j++)
    {
        file.seekg(0, ios::beg);
        while (file.read((char *)&st, sizeof(st)) && flag == 0)
            if (roll[j] == st.getroll())
            {
                ofile.write((char *)&st, sizeof(st));
                flag = 1;
            }
        flag = 0;
    }
    ofile.close();
    file.close();
    remove("student.dat");
    rename("temp.dat", "student.dat");
}

#endif
