/*
  Name: Gourav Siddhad
  Date: 08/10/13 22:27
  Description: main file of teacher student management system
*/

#include "iostream"
#include "fstream"
#include "cstdio"
#include "process.h"
#include "dos.h"

#include "student.h"
#include "teacher.h"

using namespace std;

int main()
{
    char name[20], course[20];
    long rollno;
    int marks;
    student st;

    ofstream ofile;
    ifstream ifile;

    int flag = 0, choice = 0;

    while (1)
    {
        system("cls");
        cout << "\n\t****** Welcome To Teacher And Student Management System ******\n";
        cout << "\n\t*** Student ***\n";
        cout << "\n 01. Enter Details For New Student";
        cout << "\n 02. Modify Student Details";
        cout << "\n 03. Display Student Details";
        cout << "\n 04. Display Student Performance Sheet";
        cout << "\n\n\t*** Teacher ***\n";
        cout << "\n 05. Enter Details For New Permanent Teacher";
        cout << "\n 06. Enter Details For New Guest Teacher";
        cout << "\n 07. Modify Teacher Details";
        cout << "\n 08. Display Teacher Details";
        cout << "\n 09. ";
        cout << "\n 00. Exit";
        cout << "\n\n Enter Your Option ... ";
        cin >> choice;

        switch (choice)
        {
        case 1:
            sgetdata(name, rollno, course, marks);
            student s(name, rollno, course, marks);
            ofile.open("student.dat", ios::binary | ios::app);
            ofile.write((char *)&s, sizeof(s));
            ofile.close();
            break;
        case 2:
            cout << "\n Enter Roll No Whose Data Is To Be Modified ";
            cin >> rollno;
            ifile.open("student.dat", ios::binary);
            ofile.open("temp.dat", ios::binary);
            while (ifile.read((char *)&st, sizeof(st)))
            {
                if (rollno == st.getroll())
                {
                    st.displayrecord();
                    st.getdata();
                }
                ofile.write((char *)&st, sizeof(st));
            }
            ofile.close();
            ifile.close();
            remove("student.dat");
            rename("temp.dat", "student.dat");
            break;
        case 3:
            cout << "\n Enter Roll No ";
            cin >> rollno;
            ifile.open("student.dat", ios::binary);
            while (ifile.read((char *)&st, sizeof(st)) && flag == 0)
            {
                if (rollno == st.getroll())
                {
                    st.displayrecord();
                    flag = 1;
                }
            }
            ifile.close();
            if (flag == 0)
                cout << "\n No Corresponding Data Found";
            flag = 0;
            break;
        case 4:
            ssortdata();
            performancesheet();
            break;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 0:
            exit(0);
            break;
        default:
            cout << "\n Please Enter Valid Option";
        }
        cout << endl;
        system("pause");
    }
    return 0;
}
