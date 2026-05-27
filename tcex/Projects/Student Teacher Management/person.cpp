#include "person.h"

int main()
{
    char fsname[] = "student.dat";
    char ftname[] = "teacher.dat";
    int ch = 1;
    ifstream ifile;
    ofstream ofile;
    person *p;
    student s;
    teacher t;
    while (ch != 0)
    {
        system("cls");
        cout << "\n\t\t\t STUDENT\n";
        cout << "\n 01. Enter Student Details";
        cout << "\n 02. Display Student";
        cout << "\n 03. Display All Student";
        cout << "\n 04. Modify Student";
        cout << "\n 05. Delete Student";
        cout << "\n\n\t\t\t TEACHER\n";
        cout << "\n 06. Enter Teacher Details";
        cout << "\n 07. Display Teacher";
        cout << "\n 08. Display All Teacher";
        cout << "\n 09. Modify Teacher";
        cout << "\n 00. Delete Teacher";
        cout << "\n 00. Exit";
        cout << "\n Enter Choice .. ";
        cin >> ch;
        int e, flag = 0, r;

        switch (ch)
        {
        case 1:
            p = &s;
            p->getdata();
            ofile.open(fsname, ios::binary | ios::app);
            ofile.write((char *)p, sizeof(s));
            ofile.close();
            p->display();
            system("pause");
            break;
        case 2:
            cout << "\n Enter Roll No. : ";
            cin >> r;
            ifile.open(fsname, ios::binary);
            while (ifile.read((char *)&s, sizeof(s)) && flag == 0)
                if (r == s.getroll())
                {
                    flag = 1;
                    s.display();
                    cout << endl;
                    system("pause");
                }

            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            break;
        case 3:
            ifile.open(fsname, ios::binary);
            while (ifile.read((char *)&s, sizeof(s)))
            {
                s.display();
                cout << endl;
                system("pause");
            }
            ifile.close();
            break;
        case 4:
            cout << "\n Enter Roll No. : ";
            cin >> r;
            ofile.open("temp.dat", ios::binary);
            ifile.open(fsname, ios::binary);
            while (ifile.read((char *)&s, sizeof(s)) && flag == 0)
            {
                if (r == s.getroll())
                {
                    flag = 1;
                    s.display();
                    s.getdata();
                    cout << endl;
                    system("pause");
                }
                ofile.write((char *)&s, sizeof(s));
            }
            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            ofile.close();
            remove(fsname);
            rename("temp.dat", fsname);
            break;
        case 5:
            cout << "\n Enter Roll No. : ";
            cin >> r;
            ofstream ofile("temp.dat", ios::binary);
            ifile.open(fsname, ios::binary);
            while (ifile.read((char *)&s, sizeof(s)) && flag == 0)
            {
                if (r == s.getroll())
                {
                    flag = 1;
                    s.display();
                    cout << "\n Deleted";
                    cout << endl;
                    system("pause");
                }
                else
                    ofile.write((char *)&s, sizeof(s));
            }
            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            ofile.close();
            remove(fsname);
            break;
            rename("temp.dat", fsname);
        case 6:
            t.getdata();
            ofile.open(ftname, ios::binary | ios::app);
            ofile.write((char *)&t, sizeof(t));
            ofile.close();
            system("pause");
            break;
        case 7:
            cout << "\n Enter Employee No. : ";
            cin >> e;
            ifile.open(ftname, ios::binary);
            while (ifile.read((char *)&t, sizeof(t)) && flag == 0)
                if (e == t.geteno())
                {
                    flag = 1;
                    t.display();
                    cout << endl;
                    system("pause");
                }
            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            break;
        case 8:
            ifile.open(ftname, ios::binary);
            while (ifile.read((char *)&t, sizeof(t)))
            {
                t.display();
                cout << endl;
                system("pause");
            }
            ifile.close();
            break;
        case 9:
            cout << "\n Enter Roll No. : ";
            cin >> e;
            ofstream ofile("temp.dat", ios::binary);
            ifile.open(ftname, ios::binary);
            while (ifile.read((char *)&t, sizeof(t)) && flag == 0)
            {
                if (e == t.geteno())
                {
                    flag = 1;
                    t.display();
                    t.getdata();
                    cout << endl;
                    system("pause");
                }
                ofile.write((char *)&t, sizeof(t));
            }
            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            ofile.close();
            remove(ftname);
            rename("temp.dat", ftname);
            break;
        case 10:
            cout << "\n Enter Roll No. : ";
            cin >> e;
            ofstream ofile("temp.dat", ios::binary);
            ifile.open(ftname, ios::binary);
            while (ifile.read((char *)&t, sizeof(t)) && flag == 0)
            {
                if (e == t.geteno())
                {
                    flag = 1;
                    t.display();
                    cout << "\n Deleted";
                    cout << endl;
                    system("pause");
                }
                else
                    ofile.write((char *)&t, sizeof(t));
            }
            if (flag == 0)
            {
                cout << "\n No Corresponding Data Found ";
                cout << endl;
                system("pause");
            }
            ifile.close();
            ofile.close();
            remove(ftname);
            rename("temp.dat", ftname);
            break;
        case 0:
            ch = 'n';
            exit(0);
            break;
        }
    }
    return 0;
}
