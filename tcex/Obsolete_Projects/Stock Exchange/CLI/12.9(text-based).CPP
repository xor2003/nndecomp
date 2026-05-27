#include<bios.h>
#include<conio.h>
#include<ctype.h>
#include<dos.h>
#include<fstream.h>
#include<graphics.h>
#include<iomanip.h>
#include<iostream.h>
#include<process.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
void main();
void admin();
void adminfnt();
void lcom();
void ucom();
void newuser();
void user();
void info();
void stock(char[]);
void per(double,double);
void rand_double(double,double&);
void portfolio(char[]);
void balance(char[]);
void buy(char[]);
void sell(char[]);
void buycheck(char[],char[]);
void sellcheck(char*);
void up();
void down();
void upg();
void downg();
void graph(class company);
static const int LTMARGIN = 60;
static const int TPMARGIN = 100;
struct XYScatterGraph
{
    int color;
    int points;
    double xpoints[1000];
    double ypoints[1000];
    double dataxmin;
    double dataxmax;
    double dataymin;
    double dataymax;
    double xlen;
    double ylen;
    XYScatterGraph() { }
    XYScatterGraph(int c, int numpoints);
    void FillPoints(double yarr[], double xarr[],int len);
    void Draw();
    void DrawGrid(int index = 1);
};
XYScatterGraph::XYScatterGraph(int c, int numpoints)
{
    if(numpoints > 1000)
        numpoints = 1000;
    points = numpoints;
    color = c;
    for(int i = 0; i < 1000; i++)
    {
        xpoints[i] = 0.0;
        ypoints[i] = 0.0;
    }
    dataxmin = 1000000;
    dataxmax = -1000000;
    dataymin = 1000000;
    dataymax = -1000000;
    xlen = 0;
    ylen = 0;
}
void XYScatterGraph::FillPoints(double yarr[],double xarr[], int len)
{
    for(int i = 0; i < len; i++)
    {
        if(i > points)
            break;
        xpoints[i] = int(xarr[i]);
        ypoints[i] = yarr[i];
        if(dataymin > ypoints[i])
            dataymin = ypoints[i];
        if(dataymax < ypoints[i])
            dataymax = ypoints[i];
        if(dataxmin > xpoints[i])
            dataxmin = xpoints[i];
        if(dataxmax < xpoints[i])
            dataxmax = xpoints[i];
    }
    xlen = dataxmax - dataxmin;
    ylen = dataymax - dataymin;
    dataymax = dataymax + xlen / 75.0;
    dataymin = dataymin - xlen / 75.0;
    xlen = dataxmax - dataxmin;
    ylen = dataymax - dataymin;
}
void XYScatterGraph::DrawGrid(int index)
{
    int xmax = getmaxx() - LTMARGIN * 2;
    int ymax = getmaxy() - TPMARGIN * 2;
    setcolor(WHITE);
    rectangle(LTMARGIN,TPMARGIN,LTMARGIN + xmax, TPMARGIN + ymax);
    setlinestyle(DOTTED_LINE, 1, 1);
    double xstart = dataxmin;
    double ystart = dataymax;
    for(int i = 0; i <= 10; i++)
    {
        double ypos = TPMARGIN +  (i / 10.0 * ymax);
        double xpos = LTMARGIN + (i / 10.0 * xmax);
        if( i != 10)
            line(LTMARGIN, ypos, LTMARGIN + xmax, ypos);
        line(xpos, TPMARGIN, xpos, TPMARGIN +  ymax);
        xstart = dataxmin +  (i) * xlen / 10;
        ystart = dataymax -  (i) * ylen / 10;
        char buf[128];
        if(i == 0)
            xstart = 0;
        sprintf(buf, "%3.1lf", xstart);
        if( (i % 2) == 0)
            outtextxy(xpos - 10, TPMARGIN + ymax + 10, buf);
        else
            outtextxy(xpos - 10, TPMARGIN + ymax + 30, buf);
        sprintf(buf, "%5.1lf", ystart);
        if(index == 1)
            outtextxy(LTMARGIN - 50, ypos - 5, buf);
        else
            outtextxy(LTMARGIN + xmax + 10, ypos - 5, buf);
    }
}
void XYScatterGraph::Draw()
{
    int xmax = getmaxx() - LTMARGIN * 2;
    int ymax = getmaxy() - TPMARGIN * 2;
    int xold = 0;
    int yold = 0;
    setcolor(color);
    setlinestyle(SOLID_LINE, 1, 1);
    for(int j = 0; j < points; j++)
    {
        int xpos = LTMARGIN + (xpoints[j] - dataxmin) / xlen * xmax;
        int bottom = 480;
        int ypos = bottom - TPMARGIN - (ypoints[j] - dataymin) / ylen * ymax;
        if(j > 0)
            line(xold, yold, xpos, ypos);
        xold = xpos;
        yold = ypos;
    }
}
class account
{
public:
    char acno[20];
    char name[20];
    int balance;
    account()
    {
        balance=0;
    }
    void putdata()
    {
        cout<<"User Name: ";
        puts(name);
        cout<<"Account Number: ";
        puts(acno);
        cout<<"Available Balance: "<<balance<<endl;
    }
};
class shares
{
public:
    int nos;
    char compname[50];
    double fvalue;
    double cvalue;
    shares()
    {
        nos=0;
        fvalue=0.0;
        cvalue=0.0;
    }
    void putshares()
    {
        cout<<"Company name: ";
        puts(compname);
        cout<<"No.of Shares bought: "<<nos<<endl;
        cout<<"Share bought at: "<<setprecision(2)<<cvalue<<endl;
        cout<<"Face value of each share: "<<fvalue<<endl;
        rand_double(fvalue,cvalue);
        per(fvalue,cvalue);
        cout<<endl;
    }
};
class company
{
public:
    char cname[30];
    int ccode,nshares;
    double fvalue;
    double cvalue;
    void getdata();
    void putdata();
    int getcode()
    {
        return ccode;
    }
    char *getname()
    {
        return cname;
    }
};
void company::getdata()
{
    cout<<"Enter company name: ";
    gets(cname);
    cout<<"Enter the company code: ";
    cin>>ccode;
    cout<<"Enter the face value: ";
    cin>>fvalue;
    randomize();
    nshares=random(99);
}
void company::putdata()
{
    cout<<"Company name: ";
    puts(cname);
    cout<<"Code: "<<ccode<<endl;
    cout<<"Face value of each share: "<<fvalue<<endl;
    cout<<"Total shares available: "<<nshares<<endl;
    rand_double(fvalue,cvalue);
    per(fvalue,cvalue);
}
class newu
{
    char name[20];
    int age;
    char pan[20];
    char adr[100];
    char acno[20];
public:
    void get();
    char *getname()
    {
        return name;
    }
    char *getacno()
    {
        return acno;
    }
    void put1();
    void put()
    {
        cout<<endl;
        cout<<"NAME:";
        puts(name);
        cout<<"AGE:"<<age<<endl;
        cout<<"PAN CARD NUMBER: ";
        puts(pan);
        cout<<"ADDRESS: ";
        puts(adr);
        cout<<"ACCOUNT NUMBER: ";
        puts(acno);
        cout<<endl;
    }
};
void newu::get()
{
name4:
    cout<<"Enter the name (less than 8 characters): "<<endl;
    gets(name);
    if(strlen(name)>7)
    {
        cout<<"Name should be less than 8 characters."<<endl;
        getch();
        clrscr();
        memset(name,0,20);
        goto name4;
    }
    char *name2,*name3;
    name2=new char[50];
    name3=new char[50];
    strcpy(name3,name);
    strcat(name3,".dat");
    strcpy(name2,"C:/TC/BIN/Project/");
    strcat(name2,name3);
    ifstream check1;
    check1.open(name2);
    delete[]name2;
    delete[]name3;
    if(!check1)
    {
age1:
        cout<<"Enter the age: "<<endl;
        cin>>age;
        if(cin.fail())
        {
            cin.clear();
            cin.ignore();
            cout<<"Enter a number not a character: "<<endl;
            getch();
            clrscr();
            goto age1;
        }
        if(age<18)
        {
            cout<<"You must be 18 and above to access this platform."<<endl;
            getch();
            clrscr();
            cout<<"ABORTING PROGRAM !!! (ERROR::User below 18)";
            for(int i=0; i<4; i++)
            {
                cout<<".";
                delay(250);
            }
            exit(0);
        }
        if(age>116)
        {
            cout<<"You are not Misao Okawa !!"<<endl;
            delay(1000);
            cout<<"Are you a mortal? Old people don't really care about stock market i guess...."<<endl;
            delay(1000);
            cout<<"Only mortals are allowed to use stock exchange"<<endl;
            delay(1000);
            cout<<"This is MIDGUARD,Go back to ASGUARD."<<endl;
            getch();
            clrscr();
            cout<<"ABORTING PROGRAM !!! (ERROR::User is an ASGUARDIAN)";
            for(int i=0; i<4; i++)
            {
                cout<<".";
                delay(250);
            }
            exit(0);
        }
pan1:
        cout<<"Enter pan card no. (10 characters): "<<endl;
        gets(pan);
        if(strlen(pan)!=10)
        {
            cout<<"Pan card number should be of 10 characters only."<<endl;
            getch();
            memset(pan,0,20);
            clrscr();
            goto pan1;
        }
        cout<<"Enter the address: "<<endl;
        gets(adr);
acno1:
        memset(acno,0,20);
        cout<<"Enter the bank account no. (9-18 digits) : "<<endl;
        gets(acno);
        for(int i=0; i<20; i++)
        {
            if(isalpha(acno[i])&&(!isdigit(acno[i])))
            {
                cout<<"Account number should only contain digits."<<endl;
                getch();
                memset(acno,0,20);
                clrscr();
                goto acno1;
            }
        }
        if(strlen(acno)<9||strlen(acno)>18)
        {
            cout<<"Account number should be between 9 and 18 digits only."<<endl;
            getch();
            memset(acno,0,20);
            clrscr();
            goto acno1;
        }
    }
    else
    {
        cout<<"User already exists!"<<endl;
        getch();
        memset(name,0,20);
        check1.close();
        clrscr();
        main();
    }
}
void newu::put1()
{
lb:
    clrscr();
    char ch;
    cout<<"User menu "<<endl;
    cout<<"Enter 1 for displaying profile: "<<endl;
    cout<<"Enter 2 for editing your profile: "<<endl;
    cout<<"Enter 3 to managing stocks: "<<endl;
    cout<<"Enter 4 to view portfolio: "<<endl;
    cout<<"Enter 5 to view your account balance: "<<endl;
    cout<<"Enter 6 to logout: "<<endl;
    cin>>ch;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        goto lb;
    }
    switch(ch)
    {
    case '1':
        clrscr();
        put();
        cout<<"Press Enter to continue...."<<endl;
        getchar();
        clrscr();
        goto lb;
    case '2':
        clrscr();
        newu m;
        cout<<"NAME: ";
        puts(name);
        strcpy(m.name,name);
        cout<<"AGE: "<<age<<endl;
        m.age=age;
pan2:
        cout<<"Enter the new pan card no. (10 characters): "<<endl;
        cout<<"(.) to retain the current no. "<<endl;
        gets(m.pan);
        if(strcmp(m.pan,".")==0)
        {
            strcpy(m.pan,pan);
            goto adr2;
        }
        if(strlen(m.pan)!=10)
        {
            cout<<"Pan card number should be of 10 characters only."<<endl;
            getch();
            memset(m.pan,0,20);
            clrscr();
            goto pan2;
        }
adr2:
        cout<<"Enter the new address: "<<endl;
        cout<<"(.) to retain the current address"<<endl;
        gets(m.adr);
        if(strcmp(m.adr,".")==0)
        {
            strcpy(m.adr,adr);
            goto acno2;
        }
acno2:
        memset(m.acno,0,20);
        cout<<"Enter the new bank account no. (9-18 digits) : "<<endl;
        cout<<"(.) to retain the current account no. "<<endl;
        gets(m.acno);
        if(strcmp(m.acno,".")==0)
        {
            strcpy(m.acno,acno);
        }
        else
        {
            for(int i=0; i<20; i++)
            {
                if(isalpha(m.acno[i])&&(!isdigit(m.acno[i])))
                {
                    cout<<"Account number should only contain digits."<<endl;
                    getch();
                    memset(m.acno,0,20);
                    clrscr();
                    goto acno2;
                }
            }
            if(strlen(m.acno)<9||strlen(m.acno)>18)
            {
                cout<<"Account number should be between 9 and 18 digits only."<<endl;
                getch();
                memset(m.acno,0,20);
                clrscr();
                goto acno2;
            }
        }
        strcpy(pan,m.pan);
        strcpy(adr,m.adr);
        strcpy(acno,m.acno);
        char *fname0,*fname,*fname1;
        fname0=new char[20];
        fname=new char[50];
        fname1=new char[50];
        fname0=m.name;
        strcpy(fname1,fname0);
        strcat(fname1,".dat");
        strcpy(fname,"C:/TC/BIN/Project/");
        strcat(fname,fname1);
        ofstream file4,file5;
        file5.open(fname);
        remove(fname);
        file5.clear();
        file5.close();
        file4.open(fname,ios::app|ios::binary);
        file4.write((char*)&m,sizeof(m));
        file4.clear();
        file4.close();
        delete[]fname0;
        delete[]fname1;
        delete[]fname;
        cout<<"Changes have been made to the profile"<<endl;
        cout<<"Going to user menu";
        for(int i=0; i<4; i++)
        {
            cout<<".";
            delay(250);
        }
        clrscr();
        goto lb;
    case '3':
        stock(name);
        clrscr();
        goto lb;
    case '4':
        portfolio(name);
        goto lb;
    case '6':
        clrscr();
        cout<<"You have successfully logged out ";
        puts(name);
        delay(2000);
        main();
        break;
    case '5':
        clrscr();
        balance(name);
        goto lb;
    default:
        cout<<"Wrong choice "<<endl;
        getch();
        clrscr();
        exit(0);
        break;
    }
}
void main()
{
lb2:
    clrscr();
    char n;
    cout<<" MAIN MENU "<<endl;
    cout<<"1.Administrator Login"<<endl;
    cout<<"2.User Login"<<endl;
    cout<<"3.Enlist as a new investor"<<endl;
    cout<<"4.About this program"<<endl;
    cout<<"5.Exit"<<endl;
    cout<<endl;
    cout<<"Enter your choice: ";
    cin>>n;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        goto lb2;
    }
    switch(n)
    {
    case '1':
        admin();
        break;
    case '2':
        user();
        break;
    case '3':
        newuser();
        break;
    case '4':
        info();
        break;
    case '5':
        exit(0);
        break;
    default:
        cout<<"Wrong Choice"<<endl;
        delay(2000);
        goto lb2;
    }
    getch();
}
void info()
{
    clrscr();
    cout<<"This program, STOCK EXCHANGE, was created by"<<endl;
    cout<<"Saurabh P Bhandari and Pallab Ray of class XII A, Sindhi High School,Hebbal."<<endl;
    cout<<"The program comprises various different features related to a Stock"<<endl;
    cout<<"Exchange. For example buying stocks, selling stocks, buying bonds etc."<<endl;
    cout<<"We sincerely hope you do not face any problems while using our program"<<endl;
    cout<<"for your own purposes."<<endl;
    cout<<endl;
    cout<<"Press Enter to go back to main menu"<<endl;
    getchar();
    main();
}
void admin()
{
START:
    clrscr();
    cout<<"\nEnter Password  : ";
    char pass[32],pass1[32];
    int i = 0;
    char a;
    for(i=0;;)
    {
        a=getch();
        if((a>='a'&&a<='z')||(a>='A'&&a<='Z')||(a>='0'&&a<='9'))
        {
            pass[i]=a;
            ++i;
            cout<<"*";
        }
        if(a=='\b'&&i>=1)
        {
            cout<<"\b \b";
            --i;
        }
        if(a=='\r')
        {
            pass[i]='\0';
            break;
        }
    }
    if(i<=5)
    {
        cout<<"\nMinimum 6 digits needed.\nEnter Again";
        getch();
        goto START;
    }
    cout<<endl;
    ifstream fin;
    fin.open("C:/TC/BIN/Project/Password.dat");
    if(!fin)
    {
        cerr<<"error in opening of file"<<endl;
    }
    else
    {
        fin>>pass1;
        if(strcmp(pass,pass1)==0)
        {
            cout<<"Password accepted"<<endl;
            delay(500);
            fin.close();
            adminfnt();
        }
        else
        {
            cout<<"Incorrect password"<<endl;
            delay(1500);
            goto START;
        }
        fin.close();
    }
}
void adminfnt()
{
    clrscr();
    char ch,pass[32],pass1[32];
    time_t tim;
    time(&tim);
lb4:
    cout<<"Welcome Administrator!! ";
    cout<<setw(30)<<"Login Time : "<<ctime(&tim);
    cout<<"Enter 1 for List of Companies: "<<endl;
    cout<<"Enter 2 for Change password: "<<endl;
    cout<<"Enter 3 to manage User list: "<<endl;
    cout<<"Enter 4 to Log out: "<<endl;
    cout<<"Enter your choice: "<<endl;
    cin>>ch;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        clrscr();
        goto lb4;
    }
    switch(ch)
    {
    case '1':
        lcom();
        break;
    case '4':
        clrscr();
        cout<<"You have successfully logged out"<<endl;
        delay(2000);
        main();
    case '2':
START1:
        cout<<"Enter the old password: "<<endl;
        gets(pass);
        fstream f;
        f.open("C:/TC/BIN/Project/Password.dat",ios::in);
        if(!f)
        {
            cerr<<"error in opening of file"<<endl;
        }
        else
        {
            f>>pass1;
            if(strcmp(pass,pass1)==0)
            {
                cout<<"Enter new password: "<<endl;
                int i = 0;
                char a,temp[32];
                for(i=0;;)
                {
                    a=getch();
                    if((a>='a'&&a<='z')||(a>='A'&&a<='Z')||(a>='0'&&a<='9'))
                    {
                        temp[i]=a;
                        ++i;
                        cout<<"*";
                    }
                    if(a=='\b'&&i>=1)
                    {
                        cout<<"\b \b";
                        --i;
                    }
                    if(a=='\r')
                    {
                        temp[i]='\0';
                        break;
                    }
                }
                if(i<=5)
                {
                    cout<<"\nMinimum 6 digits needed.\nEnter Again";
                    getch();
                    goto START1;
                }
                cout<<endl;
                ofstream fout;
                fout.open("C:/TC/BIN/Project/Password.dat");
                fout<<temp;
                fout.close();
                f.close();
                cout<<"Password changed"<<endl;
                delay(1500);
                adminfnt();
            }
            else
            {
                cout<<"Incorrect Password "<<endl;
                delay(2000);
                adminfnt();
            }
        }
        break;
    case '3':
        clrscr();
        ucom();
        getch();
        break;
    default:
        cout<<"Wrong choice";
        delay(1500);
        adminfnt();
        break;
    }
}
void newuser()
{
    clrscr();
    newu u;
    u.get();
    char *filename,*filename1;
    filename=new char[50];
    filename1=new char[50];
    strcpy(filename1,u.getname());
    strcat(filename1,".dat");
    strcpy(filename,"C:/TC/BIN/Project/");
    strcat(filename,filename1);
    cout<<"You have successfully enlisted as a new investor"<<endl;
    delay(1250);
    char temp[100];
    strcpy(temp,filename);
    ofstream fout1,fout2;
    fout1.open(filename,ios::app|ios::binary);
    fout1.write((char*)&u,sizeof(u));
    fout1.close();
    getchar();
    fout2.open("C:/TC/BIN/Project/Users.dat",ios::app);
    fout2<<temp<<endl;
    fout2.close();
    delete[]filename;
    delete[]filename1;
    account a;
    strcpy(a.name,u.getname());
    strcpy(a.acno,u.getacno());
    srand(time(NULL));
    int ranval=500+rand()%32000;
    a.balance=abs(ranval);
    char *aname,*aname1;
    aname=new char[50];
    aname1=new char[50];
    strcpy(aname1,a.name);
    strcat(aname1,"acco.dat");
    strcpy(aname,"C:/TC/BIN/Project/");
    strcat(aname,aname1);
    ofstream fia;
    fia.open(aname,ios::ate|ios::binary);
    fia.write((char*)&a,sizeof(a));
    fia.close();
    delete[]aname;
    delete[]aname1;
    main();
}
void user()
{
    clrscr();
    newu w;
    char *name1,*filename,*filename1;
    name1= new char[20];
    filename=new char[50];
    filename1=new char[50];
    cout<<"Welcome to User Login: "<<endl;
    cout<<"Enter your name: "<<endl;
    gets(name1);
    strcpy(filename1,name1);
    strcat(filename1,".dat");
    strcpy(filename,"C:/TC/BIN/Project/");
    strcat(filename,filename1);
    ifstream fin1;
    fin1.open(filename,ios::in|ios::binary);
    if(!fin1)
    {
        delete[]filename;
        delete[]filename1;
        delete[]name1;
        cout<<"User does not exist"<<endl;
        getchar();
        main();
    }
    else
    {
        delete[]filename;
        delete[]filename1;
        delete[]name1;
        fin1.read((char*)&w,sizeof(w));
        fin1.close();
        w.put1();
    }
}
void lcom()
{
lb:
    clrscr();
    company com,obj;
    fstream file;
    int comcode;
    file.open("C:/TC/BIN/Project/company.dat",ios::in|ios::out|ios::ate|ios::binary);
    int choice=1;
    clrscr();
    while(choice!=0)
    {
        cout<<"Enter 1 for adding a company"<<endl;
        cout<<"Enter 2 for no. of companies"<<endl;
        cout<<"Enter 3 for displaying the list"<<endl;
        cout<<"Enter 4 to go to administrator menu"<<endl;
        cout<<"Enter 5 to delete a company"<<endl;
        cout<<"Enter your choice"<<endl;
        cin>>choice;
        if(cin.fail())
        {
            cin.clear();
            cin.ignore();
            file.close();
            cout<<"Enter a number not a character: "<<endl;
            delay(2000);
            goto lb;
        }
        switch(choice)
        {
        case 1:
            cout<<"Add a company"<<endl;
            com.getdata();
            file.write((char*)&com,sizeof(com));
            clrscr();
            break;
        case 2:
            int filesize;
            filesize=file.tellg();
            int n=filesize/sizeof(com);
            cout<<"The no.of companies in the file are "<<n<<endl;
            getchar();
            clrscr();
            break;
        case 3:
            if(file.tellg()==0)
            {
                cout<<"No companies are present in the file"<<endl;
                cout<<"Press Enter to continue...."<<endl;
                getchar();
                clrscr();
                lcom();
                break;
            }
            else
            {
                file.seekg(0,ios::beg);
                cout<<"The current contents of the files are "<<endl;
                while(file.read((char*)&com,sizeof(com)))
                {
                    com.putdata();
                    cout<<"Press Enter to continue...."<<endl;
                    getchar();
                }
                file.clear();
            }
            clrscr();
            break;
        case 4:
            file.close();
            admin();
            break;
        case 5:
            ofstream fout;
            fout.open("C:/TC/BIN/Project/temp.dat",ios::binary);
            int ccode,check=0;
            cout<<"Enter company code whose record is to be deleted"<<endl;
            cin>>ccode;
            file.seekg(0,ios::beg);
            while(file.read((char*)&com,sizeof(com)))
            {
                if(com.getcode()==ccode)
                {
                    check=1;
                }
                else
                {
                    fout.write((char*)&com,sizeof(com));
                }
            }
            file.close();
            fout.close();
            remove("C:/TC/BIN/Project/company.dat");
            rename("C:/TC/BIN/Project/temp.dat","C:/TC/BIN/Project/company.dat");
            file.open("C:/TC/BIN/Project/company.dat",ios::in|ios::out|ios::ate|ios::binary);
            if(check==0)
            {
                cout<<"Company code not found"<<endl;
            }
            else
            {
                cout<<"Company successfully deleted"<<endl;
            }
            getch();
            clrscr();
            break;
        default:
            cout<<"Wrong choice";
            file.close();
            getch();
            clrscr();
            break;
        }
    }
    getch();
}
void ucom()
{
lb0:
    clrscr();
    newu q;
    char loc[100],loc2[100];
    int choice=1;
    clrscr();
    while(choice!=0)
    {
        cout<<"Enter 1 for no. of users"<<endl;
        cout<<"Enter 2 for displaying the users"<<endl;
        cout<<"Enter 3 for deleting users"<<endl;
        cout<<"Enter 4 to go to administrator menu"<<endl;
        cout<<"Enter your choice"<<endl;
        cin>>choice;
        if(cin.fail())
        {
            cin.clear();
            cin.ignore();
            cout<<"Enter a number not a character: "<<endl;
            delay(2000);
            goto lb0;
        }
        switch(choice)
        {
        case 1:
            int count=0;
            fstream file;
            file.open("C:/TC/BIN/Project/Users.dat",ios::in);
            if(!file)
            {
                cerr<<"File does not exist"<<endl;
                delay(1000);
                clrscr();
                main();
            }
            while(!file.eof())
            {
                file.getline(loc,100);
                if(loc[0]=='C')
                    count++;
            }
            file.close();
            cout<<"The no.of users in the file are "<<count<<endl;
            getchar();
            clrscr();
            break;
        case 2:
            fstream file1,file2;
            file1.open("C:/TC/BIN/Project/Users.dat",ios::in);
            if(!file1)
            {
                cerr<<"File not found"<<endl;
                delay(1250);
                main();
            }
            int p=0;
            while(!file1.eof())
            {
                file1.getline(loc2,100);
                if(loc2[0]=='C')
                    p++;
            }
            file1.close();
            if(p==0)
            {
                cout<<"No users present in the database"<<endl;
                delay(1250);
                clrscr();
                break;
            }
            else
            {
                file2.open("C:/TC/BIN/Project/Users.dat",ios::in);
                cout<<"The current contents of the files are "<<endl;
                getchar();
                fstream fin;
                for(int i=0; i<50; i++)
                {
                    file2.getline(loc2,100);
                    fin.open(loc2,ios::in|ios::binary);
                    if(!fin)
                        continue;
                    fin.read((char*)&q,sizeof(q));
                    q.put();
                    cout<<"Press Enter to continue...."<<endl;
                    getchar();
                    fin.clear();
                    fin.close();
                }
                file2.clear();
                file2.close();
            }
            clrscr();
            break;
        case 3:
            clrscr();
            char *user,*filename,*filename1;
            user= new char[20];
            filename=new char[50];
            filename1=new char[50];
            cout<<"Enter the user name to be deleted: "<<endl;
            gets(user);
            strcpy(filename1,user);
            strcat(filename1,".dat");
            strcpy(filename,"C:/TC/BIN/Project/");
            strcat(filename,filename1);
            fstream fins;
            fins.open(filename,ios::in);
            if(!fins)
            {
                cout<<"User not found"<<endl;
                delay(1500);
                clrscr();
                break;
            }
            else
            {
                cout<<"User successfully deleted"<<endl;
                fins.close();
                remove(filename);
                char *pname,*pname1,*aname,*aname1;
                pname=new char[50];
                pname1=new char[50];
                aname=new char[50];
                aname1=new char[50];
                strcpy(pname1,user);
                strcpy(aname1,user);
                strcat(pname1,"share.dat");
                strcat(aname1,"acco.dat");
                strcpy(pname,"C:/TC/BIN/Project/");
                strcpy(aname,pname);
                strcat(pname,pname1);
                strcat(aname,aname1);
                fstream share,acco;
                share.open(pname,ios::binary);
                remove(pname);
                acco.open(aname,ios::binary);
                remove(aname);
                delay(1500);
                share.close();
                acco.close();
                clrscr();
                delete[]pname;
                delete[]pname1;
                delete[]aname;
                delete[]aname1;
            }
            fstream file3;
            file3.open("C:/TC/BIN/Project/Users.dat",ios::in);
            ofstream fout;
            fout.open("C:/TC/BIN/Project/temp.dat",ios::out);
            while(file3.eof()==0)
            {
                file3.getline(loc2,100);
                if(strcmp(loc2,filename)!=0)
                {
                    fout<<loc2<<endl;
                }
            }
            file3.close();
            fout.close();
            remove("C:/TC/BIN/Project/Users.dat");
            rename("C:/TC/BIN/Project/temp.dat","C:/TC/BIN/Project/Users.dat");
            delete[]filename;
            delete[]user;
            delete[]filename1;
            break;
        case 4:
            admin();
            break;
        default:
            cout<<"Wrong choice";
            getch();
            clrscr();
            exit(0);
            break;
        }
    }
}
void stock(char name[20])
{
stock:
    clrscr();
    char d;
    cout<<"Enter 1 to buy shares: "<<endl;
    cout<<"Enter 2 to sell shares: "<<endl;
    cout<<"Enter 3 to go back to user menu: "<<endl;
    cin>>d;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        goto stock;
    }
    clrscr();
    switch(d)
    {
    case '1':
        buy(name);
        break;
    case '2':
        sell(name);
        break;
    case '3':
        clrscr();
        break;
    default:
        cout<<"Wrong choice "<<endl;
        getch();
        clrscr();
        break;
    }
}
void per(double fvalue,double cvalue)
{
    if(cvalue<fvalue)
    {
        double p;
        p=double(100.0-(cvalue/fvalue)*100.0);
        cout<<"Current value of each share: "<<setprecision(2)<<cvalue;
        down();
        cout<<endl;
        cout<<"Decrease: "<<setprecision(2)<<double(cvalue-fvalue)<<endl;
        cout<<"Percentage decrease: "<<setprecision(2)<<"-"<<double(p)<<"%"<<endl;
    }
    else if(cvalue>fvalue)
    {
        double p;
        p=double(100.0-(fvalue/cvalue)*100.0);
        cout<<"Current value of each share: "<<setprecision(2)<<cvalue;
        up();
        cout<<endl;
        cout<<"Increase: "<<setprecision(2)<<"+"<<double(cvalue-fvalue)<<endl;
        cout<<"Percentage increase: "<<setprecision(2)<<"+"<<double(p)<<"%"<<endl;
    }
    else
    {
        cout<<"No change"<<endl;
    }
}
void rand_double(double f,double&c)
{
    int x,y;
    randomize();
    x=1+random(100);
    if(f>x)
    {
        randomize();
        y=1+random(100);
    }
    else if(f<x)
    {
        randomize();
        y=1+random(x);
    }
    else
    {
        y=x;
    }
    srand(time(NULL));
    double ran_val=1.0*rand()/(RAND_MAX/2)+rand()%y;
    if(x<50)
    {
        c=double(f+ran_val);
    }
    else
    {
        c=abs(double(f-ran_val));
    }
}
void portfolio(char n[20])
{
    clrscr();
    shares s2;
    char *pname,*pname1;
    pname=new char[50];
    pname1=new char[50];
    strcpy(pname1,n);
    strcat(pname1,"share.dat");
    strcpy(pname,"C:/TC/BIN/Project/");
    strcat(pname,pname1);
    ifstream inshare;
    inshare.open(pname,ios::binary);
    if(!inshare)
    {
        cout<<"Press Enter to continue...."<<endl;
        getchar();
        clrscr();
        goto f;
    }
    cout<<"\nPORTFOLIO: "<<endl;
    inshare.seekg(0,ios::beg);
    while(inshare.read((char*)&s2,sizeof(s2)))
    {
        s2.putshares();
        cout<<endl;
        cout<<"Press Enter to continue...."<<endl;
        getchar();
    }
f:
    inshare.close();
    clrscr();
}
void balance(char name[20])
{
    clrscr();
    account a1;
    char *bname,*bname1;
    bname=new char[50];
    bname1=new char[50];
    strcpy(bname1,name);
    strcat(bname1,"acco.dat");
    strcpy(bname,"C:/TC/BIN/Project/");
    strcat(bname,bname1);
    ifstream acc;
    acc.open(bname,ios::binary);
    if(!acc)
    {
        cout<<"Press Enter to continue...."<<endl;
        getchar();
        clrscr();
        goto balance;
    }
    cout<<"\nACCOUNT BALANCE: "<<endl;
    acc.seekg(0,ios::beg);
    acc.read((char*)&a1,sizeof(a1));
    a1.putdata();
    cout<<"Press Enter to continue...."<<endl;
    getchar();
balance:
    acc.close();
    clrscr();
    delete[]bname;
    delete[]bname1;
}
void buy(char name[20])
{
buy:
    company e;
    int code;
    char a;
    fstream fis;
    fis.open("C:/TC/BIN/Project/company.dat",ios::in|ios::out|ios::ate|ios::binary);
    cout<<"Enter 1 to enter the company code of the company you want to buy shares from: "<<endl;
    cout<<"Enter 2 to display the list of companies: "<<endl;
    cout<<"Enter 3 to go back to user menu: "<<endl;
    cin>>a;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        fis.close();
        goto buy;
    }
    switch(a)
    {
    case '1':
        int check=1;
        cout<<"Enter the company code"<<endl;
        cin>>code;
        fis.seekg(0,ios::beg);
        while(fis.read((char*)&e,sizeof(e)))
        {
            if(e.getcode()==code)
            {
                check=0;
                break;
            }
        }
        if(check==1)
        {
            cout<<"Company with this code does not exist"<<endl;
            getchar();
            clrscr();
            fis.close();
            goto buy;
        }
        else
        {
            e.putdata();
            getch();
            check=0;
gb:
            char ch;
            clrscr();
            cout<<"Enter 1 to view the graph of this company: "<<endl;
            cout<<"Enter 2 to continue buying: "<<endl;
            cin>>ch;
            if(cin.fail())
            {
                cin.clear();
                cin.ignore();
                cout<<"Enter a number not a character: "<<endl;
                delay(2000);
                goto gb;
            }
            switch(ch)
            {
            case '1':
                graph(e);
                goto gb;
            case '2':
nss:
                clrscr();
                char *sname,*sname1;
                sname=new char[50];
                sname1=new char[50];
                strcpy(sname1,name);
                strcat(sname1,"share.dat");
                strcpy(sname,"C:/TC/BIN/Project/");
                strcat(sname,sname1);
                ofstream fshare;
                fshare.open(sname,ios::ate|ios::binary);
                delete[]sname1;
                delete[]sname;
                shares s1;
                int ns;
                cout<<"\nEnter the no.of shares you want to buy: "<<endl;
                cin>>ns;
                if(cin.fail())
                {
                    cin.clear();
                    cin.ignore();
                    cout<<"Enter a number not a character: "<<endl;
                    getch();
                    clrscr();
                    fshare.close();
                    goto nss;
                }
                if(e.nshares==0)
                {
                    cout<<"Sorry this Company has no shares available at this time!!"<<endl;
                    getch();
                    cout<<"Contact admin to delist the company"<<endl;
                    getch();
                    clrscr();
                    fshare.close();
                    fis.close();
                    break;
                }
                else if(ns>e.nshares)
                {
                    cout<<ns<<" shares exceeds the available lot."<<endl;
                    getchar();
                    clrscr();
                    fshare.close();
                    goto nss;
                }
                else if(ns<=0)
                {
                    cout<<"Number of shares cannot be negative or 0."<<endl;
                    getchar();
                    clrscr();
                    fshare.close();
                    fis.close();
                    break;
                }
                else if(e.nshares<0)
                {
                    cout<<"Available shares cannot be negative"<<endl;
                    getch();
                    cout<<"Contact Admin to resolve this issue"<<endl;
                    getch();
                    clrscr();
                    fshare.close();
                    fis.close();
                    break;
                }
                else
                {
                    account a1;
                    char *bname,*bname1;
                    bname=new char[50];
                    bname1=new char[50];
                    strcpy(bname1,name);
                    strcat(bname1,"acco.dat");
                    strcpy(bname,"C:/TC/BIN/Project/");
                    strcat(bname,bname1);
                    fstream acc;
                    acc.open(bname,ios::in|ios::binary);
                    acc.seekg(0,ios::beg);
                    acc.read((char*)&a1,sizeof(a1));
                    remove(bname);
                    acc.close();
                    a1.putdata();
                    getch();
                    cout<<endl;
                    a1.balance-=int(ns*e.cvalue);
                    if(a1.balance<500)
                    {
                        cout<<"Transaction could not be completed. (ERROR::Not enough cash)"<<endl;
                        cout<<"Add the required cash to completed transaction"<<endl;
                        getch();
                        fshare.close();
                        fis.close();
                        break;
                    }
                    cout<<"Updated Balance"<<endl;
                    a1.putdata();
                    ofstream acc1;
                    getch();
                    acc1.open(bname,ios::binary);
                    acc1.write((char*)&a1,sizeof(a1));
                    acc1.close();
                    delete[]bname;
                    delete[]bname1;
                    e.nshares-=ns;
                    s1.nos=ns;
                    s1.cvalue=e.cvalue;
                    strcpy(s1.compname,e.cname);
                    s1.fvalue=e.fvalue;
                    fshare.write((char*)&s1,sizeof(s1));
                    company y;
                    ofstream fit;
                    fit.open("C:/TC/BIN/Project/temp.dat",ios::binary);
                    fis.seekg(0,ios::beg);
                    while(fis.read((char*)&y,sizeof(y)))
                    {
                        if(y.getcode()!=e.getcode())
                        {
                            fit.write((char*)&y,sizeof(y));
                        }
                    }
                    fit.write((char*)&e,sizeof(e));
                    fis.close();
                    fit.close();
                    fshare.close();
                    remove("C:/TC/BIN/Project/company.dat");
                    rename("C:/TC/BIN/Project/temp.dat","C:/TC/BIN/Project/company.dat");
                    clrscr();
                    buycheck(name,s1.compname);
                }
                break;
            default:
                cout<<"Wrong Choice"<<endl;
                getch();
                goto gb;
            }
            fis.close();
            goto buy;
        }
    case '2':
        clrscr();
        fis.seekg(0,ios::beg);
        while(fis.read((char*)&e,sizeof(e)))
        {
            e.putdata();
            cout<<"Press Enter to continue...."<<endl;
            getchar();
        }
        fis.clear();
        fis.close();
        clrscr();
        goto buy;
    case '3':
        fis.close();
        clrscr();
        break;
    default:
        cout<<"Wrong choice "<<endl;
        getch();
        fis.close();
        clrscr();
        break;
    }
}
void sell(char name[20])
{
sell:
    clrscr();
    fstream fib;
    char t;
    company h;
    fib.open("C:/TC/BIN/Project/company.dat",ios::in|ios::out|ios::ate|ios::binary);
    cout<<"Enter 1 to enter the name of the company you want to sell shares of: "<<endl;
    cout<<"Enter 2 to display your portfolio: "<<endl;
    cout<<"Enter 3 to go back to user menu: "<<endl;
    cin>>t;
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not a character: "<<endl;
        delay(2000);
        goto sell;
    }
    switch(t)
    {
    case '1':
        char n[20];
        int scheck=1,scheck1=1;
        cout<<"Enter the name of the company: "<<endl;
        gets(n);
        fib.seekg(0,ios::beg);
        while(fib.read((char*)&h,sizeof(h)))
        {
            if(strcmp(h.getname(),n)==0)
            {
                scheck=0;
                break;
            }
        }
        if(scheck==1)
        {
            cout<<"This company name does not exist"<<endl;
            getchar();
            clrscr();
            fib.close();
            goto sell;
        }
        else
        {
            shares s3;
            char *pname,*pname1;
            pname=new char[50];
            pname1=new char[50];
            strcpy(pname1,name);
            strcat(pname1,"share.dat");
            strcpy(pname,"C:/TC/BIN/Project/");
            strcat(pname,pname1);
            fstream inshare1;
            inshare1.open(pname,ios::in|ios::out|ios::ate|ios::binary);
            delete[]pname1;
            inshare1.seekg(0,ios::beg);
            while(inshare1.read((char*)&s3,sizeof(s3)))
            {
                if(strcmp(s3.compname,n)==0)
                {
                    scheck1=0;
                    break;
                }
            }
            if(scheck1==1)
            {
                cout<<"No transaction has taken place with this company"<<endl;
                getch();
                clrscr();
                fib.close();
                inshare1.close();
                delete[]pname;
                goto sell;
            }
            else
            {
                s3.putshares();
                cout<<endl;
                cout<<"Press Enter to continue...."<<endl;
                getchar();
sell1:
                int ns;
                cout<<"\nEnter the no.of shares you want to sell: "<<endl;
                cin>>ns;
                if(s3.nos>=ns)
                {
                    account a1;
                    char *bname,*bname1;
                    bname=new char[50];
                    bname1=new char[50];
                    strcpy(bname1,name);
                    strcat(bname1,"acco.dat");
                    strcpy(bname,"C:/TC/BIN/Project/");
                    strcat(bname,bname1);
                    fstream acc;
                    acc.open(bname,ios::in|ios::binary);
                    acc.seekg(0,ios::beg);
                    acc.read((char*)&a1,sizeof(a1));
                    remove(bname);
                    acc.close();
                    a1.putdata();
                    getch();
                    a1.balance+=int(ns*h.cvalue);
                    cout<<"Updated Balance"<<endl;
                    a1.putdata();
                    ofstream acc1;
                    getch();
                    acc1.open(bname,ios::binary);
                    acc1.write((char*)&a1,sizeof(a1));
                    acc1.close();
                    delete[]bname;
                    delete[]bname1;
                    s3.nos-=ns;
                    shares s4;
                    fstream fsell;
                    ofstream ftemp,ftemp1;
                    fsell.open(pname,ios::in|ios::out|ios::ate|ios::binary);
                    ftemp.open("C:/TC/BIN/Project/temp.dat",ios::binary);
                    fsell.seekg(0,ios::beg);
                    while(fsell.read((char*)&s4,sizeof(s4)))
                    {
                        if(strcmp(s4.compname,s3.compname)!=0)
                            ftemp.write((char*)&s4,sizeof(s4));
                    }
                    ftemp.write((char*)&s3,sizeof(s3));
                    fsell.close();
                    ftemp.close();
                    remove(pname);
                    rename("C:/TC/BIN/Project/temp.dat",pname);
                    h.nshares+=ns;
                    company z;
                    ftemp1.open("C:/TC/BIN/Project/temp.dat",ios::binary);
                    fib.seekg(0,ios::beg);
                    while(fib.read((char*)&z,sizeof(z)))
                    {
                        if(z.getcode()!=h.getcode())
                            ftemp1.write((char*)&z,sizeof(z));
                    }
                    ftemp1.write((char*)&h,sizeof(h));
                    fib.close();
                    ftemp1.close();
                    remove("C:/TC/BIN/Project/company.dat");
                    rename("C:/TC/BIN/Project/temp.dat","C:/TC/BIN/Project/company.dat");
                    clrscr();
                    sellcheck(pname);
                    delete[]pname;
                }
                else if(ns<=0)
                {
                    cout<<"Number of shares cannot be negative or 0."<<endl;
                    getchar();
                    goto sell1;
                }
                inshare1.close();
                goto sell;
            }
        }
    case '2':
        portfolio(name);
        goto sell;
    case '3':
        fib.close();
        clrscr();
        break;
    default:
        cout<<"Wrong choice "<<endl;
        getch();
        fib.close();
        clrscr();
        break;
    }
}
void buycheck(char name[20],char cname[20])
{
    char *dname,*dname1;
    dname=new char[50];
    dname1=new char[50];
    strcpy(dname1,name);
    strcat(dname1,"share.dat");
    strcpy(dname,"C:/TC/BIN/Project/");
    strcat(dname,dname1);
    fstream inshare2;
    int d=0,unos=0;
    double cur;
    shares s5,s6;
    inshare2.open(dname,ios::in|ios::out|ios::ate|ios::binary);
    delete[]dname1;
    inshare2.seekg(0,ios::beg);
    while(inshare2.read((char*)&s5,sizeof(s5)))
    {
        if(strcmp(s5.compname,cname)==0)
        {
            d++;
            if(d==1)
            {
                s6=s5;
            }
            if(d==2)
            {
                unos=s5.nos;
                cur=s5.cvalue;
            }
        }
    }
    if(d==2)
    {
        s6.nos+=unos;
        s6.cvalue=cur;
        shares s7;
        inshare2.close();
        fstream inshare3;
        inshare3.open(dname,ios::in|ios::out|ios::ate|ios::binary);
        ofstream ftemp;
        ftemp.open("C:/TC/BIN/Project/temp.dat",ios::binary);
        inshare3.seekg(0,ios::beg);
        while(inshare3.read((char*)&s7,sizeof(s7)))
        {
            if(strcmp(s7.compname,s6.compname)!=0)
                ftemp.write((char*)&s7,sizeof(s7));
        }
        ftemp.write((char*)&s6,sizeof(s6));
        inshare3.close();
        ftemp.close();
        remove(dname);
        rename("C:/TC/BIN/Project/temp.dat",dname);
        delete[]dname;
    }
    else
    {
        delete[]dname;
        inshare2.close();
    }
}
void sellcheck(char*pname)
{
    cout<<"Checking for existing companies having 0 zero shares in your portfolio"<<endl;
    for(int i=0; i<7; i++)
    {
        cout<<".";
        delay(250);
    }
    shares s8;
    int check=1;
    fstream inshare4;
    inshare4.open(pname,ios::in|ios::out|ios::ate|ios::binary);
    ofstream ftemp;
    ftemp.open("C:/TC/BIN/Project/temp.dat",ios::binary);
    inshare4.seekg(0,ios::beg);
    while(inshare4.read((char*)&s8,sizeof(s8)))
    {
        if(s8.nos==0)
        {
            check=0;
        }
        else
        {
            ftemp.write((char*)&s8,sizeof(s8));
        }
    }
    inshare4.close();
    ftemp.close();
    remove(pname);
    rename("C:/TC/BIN/Project/temp.dat",pname);
    if(check==1)
    {
        cout<<endl<<"Your portfolio is alright."<<endl;
        getch();
    }
    else
    {
        cout<<endl<<"The company you sold now has 0 shares in your portfolio."<<endl;
        getch();
        cout<<"Portfolio has been successfully repaired!!"<<endl;
        getch();
    }
}
void up()
{
    char ch=30;
    textcolor(GREEN+BLINK);
    cprintf("%c",ch);
    textcolor(WHITE);
}
void down()
{
    char ch=31;
    textcolor(RED+BLINK);
    cprintf("%c",ch);
    textcolor(WHITE);
}
void upg()
{
    char *p=NULL;
    char t=30;
    sprintf(p,"%c",t);
    setcolor(GREEN+BLINK);
    outtextxy(175,80,p);
    delete p;
}
void downg()
{
    char *p=NULL;
    char t=31;
    sprintf(p,"%c",t);
    setcolor(RED+BLINK);
    outtextxy(175,80,p);
    delete p;
}
void graph(company b)
{
    int grd, grm;
    detectgraph(&grd,&grm);
    initgraph(&grd, &grm, "C:\\TC\\BGI");
    outtextxy(10,20,"Company Name:");
    outtextxy(130,20,b.cname);
    outtextxy(10,40,"Security Code:");
    char code[4],fval[10],cval[10];
    sprintf(code,"%d",b.ccode);
    outtextxy(130,40,code);
    outtextxy(10,60,"Face Value:");
    sprintf(fval,"%.2f",b.fvalue);
    outtextxy(130,60,fval);
    outtextxy(10,80,"Current Value:");
    sprintf(cval,"%.2f",b.cvalue);
    outtextxy(130,80,cval);
    outtextxy(450,20,"x-axis: Current Value");
    outtextxy(450,40,"y-axis: Time");
    int color=getcolor();
    if(b.cvalue>b.fvalue)
    {
        upg();
        setcolor(color);
    }
    else if(b.cvalue<b.fvalue)
    {
        downg();
        setcolor(color);
    }
    double yarr[100],xarr[100];
    int t=0,x=0;
    for(int i=0; i<99; i++)
    {
        if(t%10==0)
        {
            t++;
            yarr[i]=b.cvalue+random(100);
        }
        else if(t%5==0)
        {
            t++;
            yarr[i]=abs(b.cvalue-random(100));
        }
        else
        {
            yarr[i]=b.fvalue;
            t++;
        }
        xarr[i]=x;
        x=x+1;
    }
    yarr[i]=b.cvalue;
    xarr[i]=100.0;
    setbkcolor(BLACK);
    int colour[]= {1,2,3,4,5,7,20,57,58,59,60,61,62,63};
    randomize();
    i=random(14);
    XYScatterGraph myGraph1(colour[i],100);
    myGraph1.FillPoints(yarr,xarr,100);
    myGraph1.DrawGrid(1);
    myGraph1.Draw();
    getch();
    closegraph();
}
