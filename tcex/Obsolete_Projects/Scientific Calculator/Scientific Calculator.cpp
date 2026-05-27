//SCIENTIFIC CALCULATOR done by-Saurabh And Prajwal ,Class XI-A
#include<iostream.h>
#include<conio.h>
#include<math.h>
#include<process.h>
#include<dos.h>
#include<graphics.h>
#include<stdlib.h>
#include<string.h>
#define PI 3.141
int m1();
void check();
void main()
{
    //m1();
lb:
    int gd=DETECT,gm;
    initgraph(&gd, &gm,"C:\\TC\\BGI");
    double num1,num2,num3,total=0;
    char ch1,ch2,m;
    cleardevice();
    /*  setcolor(2);
      outtextxy(10,10,"____________________________SCIENTIFIC CALCULATOR_________________________________");
      setcolor(3);
      outtextxy(10,25,"---------------------------Designed By PRAJWAL AND SAURABH---------------------");
      */
    setcolor(4);
    outtextxy(10,10,"This is  3 operands and 2 operators calculator");
    setcolor(5);
    outtextxy(10,25,"****** MENU OF THE CALCULATOR ******");
    setcolor(6);
    outtextxy(10,45,"Operations of calculator                      Symbol");
    setcolor(7);
    outtextxy(10,60,"_________________________                    _______");
    setcolor(9);
    outtextxy(10,80,"1.Addition                                    : (+)");
    outtextxy(10,100,"2.Subtraction                                 : (-)");
    outtextxy(10,120,"3.Multiplication                              : (*)");
    outtextxy(10,140,"4.Division                                    : (/)");
    outtextxy(10,160,"5.Power function                              : (p)");
    outtextxy(10,180,"6.Sin function                                : (s)");
    outtextxy(10,200,"7.Cos function                                : (c)");
    outtextxy(10,220,"8.Tan function                                : (t)");
    outtextxy(10,240,"9.Natural Logarithm and Base 10 Logarithm     : (l)");
    outtextxy(10,260,"10.Factorial                                  : (f)");
    outtextxy(10,280,"11.Square root                                : (r)");
    outtextxy(10,300,"12.nPr,nCr                                    : (n)");
    outtextxy(10,320," EXIT                                         : (e)");
    delay(1000);
    gotoxy(1,22);
    cout<<"Enter the operation"<<endl;
    cin>>ch1;
    switch (ch1)
    {
    case '+':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"Enter the second operand"<<endl;
        cin>>num2;
        check();
        total=num1+num2;
        cout<<num1<<"+"<<num2<<"="<<total<<endl;
lb1:
        cout<<"Do you want to continue(y/n)"<<endl;
        cin>>m;
        if(m=='y')
        {
            cout<<"Enter the second operator"<<endl;
            cin>>ch2;
            cout<<"Enter the third number"<<endl;
            cin>>num3;
            check();
            switch (ch2)
            {
            case'+':
                total=num1+num2+num3;
                cout<<num1<<"+"<<num2<<"+"<<num3<<"="<<total<<endl;
                delay(5000);
                goto lb;
                break;
            case'-':
                total=num1+num2-num3;
                cout<<num1<<"+"<<num2<<"-"<<num3<<"="<<total<<endl;
                delay(5000);
                goto lb;
                break;
            case'*':
                total=(num1+num2)*num3;
                cout<<num1<<"+"<<num2<<"*"<<num3<<"="<<total<<endl;
                delay(5000);
                goto lb;
                break;
            case'/':
                total=(num1+num2)/num3;
                cout<<num1<<"+"<<num2<<"/"<<num3<<"="<<total<<endl;
                delay(5000);
                goto lb;
                break;
            default:
                cout<<"You have entered the wrong choice"<<endl;
                delay(3000);
                goto lb;
                break;
            }

            break;
        }
        else if(m=='n')
            goto lb;
        else
            cout<<"Wrong choice"<<endl;
        goto lb1;
    case '-':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"Enter the second operand"<<endl;
        cin>>num2;
        check();
        total=num1-num2;
        cout<<num1<<"-"<<num2<<"="<<total<<endl;
lb2:
        cout<<"Do you want to continue(y/n)"<<endl;
        cin>>m;
        if(m=='y')
        {
            cout<<"Enter the second operator"<<endl;
            cin>>ch2;
            cout<<"Enter the third number"<<endl;
            cin>>num3;
            check();
            switch (ch2)
            {
            case '+':
                total=num1-num2+num3;
                cout<<num1<<"-"<<num2<<"+"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '-':
                total=num1-num2-num3;
                cout<<num1<<"-"<<num2<<"-"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '*':
                total=(num1-num2)*num3;
                cout<<num1<<"-"<<num2<<"*"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '/':
                total=(num1-num2)/num3;
                cout<<num1<<"-"<<num2<<"/"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            default:
                cout<<"You have entered the wrong choice"<<endl;
                delay(3000);
                goto lb;
                break;
            }
        }
        else if(m=='n')
            goto lb;
        else
            cout<<"Wrong choice"<<endl;
        goto lb2;


    case '*':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"Enter the second operand"<<endl;
        cin>>num2;
        check();
        total=num1*num2;
        cout<<num1<<"*"<<num2<<"="<<total<<endl;
lb3:
        cout<<"Do you want to continue(y/n)"<<endl;
        cin>>m;
        if(m=='y')
        {
            cout<<"Enter the second operator"<<endl;
            cin>>ch2;
            cout<<"Enter the third number"<<endl;
            cin>>num3;
            check();
            switch(ch2)
            {
            case '+':
                total=(num1*num2)+num3;
                cout<<num1<<"*"<<num2<<"+"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '-':
                total=(num1*num2)+num3;
                cout<<num1<<"*"<<num2<<"-"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '*':
                total=num1*num2*num3;
                cout<<num1<<"*"<<num2<<"*"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            case '/':

                total=(num1*num2)/num3;
                cout<<num1<<"*"<<num2<<"/"<<num3<<"="<<total;
                delay(5000);
                goto lb;
                break;
            default:
                cout<<"You have entered the wrong choice"<<endl;
                delay(3000);
                goto lb;
                break;
            }
        }
        else if(m=='n')
            goto lb;
        else
            cout<<"Wrong choice"<<endl;
        goto lb3;

    case '/':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"Enter the second operand"<<endl;
        cin>>num2;
        check();
        if(num2!=0)
        {
            total=num1/num2;
            cout<<num1<<"/"<<num2<<"="<<total<<endl;
lb4:
            cout<<"Do you want to continue(y/n)"<<endl;
            cin>>m;
            if(m=='y')
            {
                cout<<"Enter the second operator"<<endl;
                cin>>ch2;
                cout<<"Enter the third number"<<endl;
                cin>>num3;
                check();
                switch(ch2)
                {
                case '+':
                    total=(num1/num2)+num3;
                    cout<<num1<<"/"<<num2<<"+"<<num3<<"="<<total;
                    delay(5000);
                    goto lb;
                    break;
                case '-':
                    total=(num1/num2)+num3;
                    cout<<num1<<"/"<<num2<<"-"<<num3<<"="<<total;
                    delay(5000);
                    goto lb;
                    break;
                case '*':
                    total=(num1/num2)*num3;
                    cout<<num1<<"/"<<num2<<"*"<<num3<<"="<<total;
                    delay(5000);
                    goto lb;
                    break;
                case '/':
                    total=(num1/num2)/num3;
                    cout<<num1<<"/"<<num2<<"/"<<num3<<"="<<total;
                    delay(5000);
                    goto lb;
                    break;
                default:
                    cout<<"You have entered the wrong choice"<<endl;
                    delay(3000);
                    goto lb;
                    break;
                }
            }
            else if(m=='n')
                goto lb;
            else
                cout<<"Wrong choice"<<endl;
            goto lb4;
        }
        else
            cout<<"Divide by zero error"<<endl;
        delay(5000);
        goto lb;
    case 'p':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"Enter the index of number"<<endl;
        int h;
        cin>>h;
        check();
        total=pow(num1,h);
        cout<<" Power of "<< num1 <<" to "<< h <<" is "<< total;
        delay(5000);
        goto lb;

    case 's':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"You have chosen the sine function"<<endl;
        num1=num1*PI/180;
        total=sin(num1);
        cout<<"Sine of "<<num1<<" radians is "<<total<<endl;
        delay(5000);
        goto lb;
    case 'c':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        num1=num1*PI/180;
        cout<<"You have chosen the cosine function"<<endl;
        total=cos(num1);
        cout<<"Cosine of "<<num1<<" radians is "<<total<<endl;
        delay(5000);
        goto lb;
    case 't':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        num1=num1*PI/180;
        cout<<"You have chosen the tangent fuction"<<endl;
        total=tan(num1);
        cout<<"Tangent of "<<num1<<" radians is "<<total<<endl;
        delay(5000);
        goto lb;
    case 'l':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"You have chosen the logarithm function"<<endl;
        cout<<"Which log funtion"<<endl;
        cout<<"1) Natural log"<<endl;
        cout<<"2) Base 10 log"<<endl;
        cout<<"Choose (1) or (2)"<<endl;
        char n;
        cin>>n;
        if(n=='1')
        {
            total=log(num1);
            cout<<"Natural log of "<<num1<<" is "<<total<<endl;
        }
        else if(n=='2')
        {
            total=log10(num1);
            cout<<"Base 10 log of "<<num1<<" is "<<total<<endl;
        }
        else
        {
            cout<<"Wrong choice"<<endl;

        }
        delay(5000);
        goto lb;

    case 'f':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"You have chosen the factorial function"<<endl;
        long int fact=1;
        for(int i=num1; i>1; i--)
        {
            fact=fact*i;
        }
        cout<<"Factorial of "<<num1<<"*"<<num1-1<<"*"<<num1-2<<"..........*"<<1<<" is "<<fact<<endl;
        delay(5000);
        goto lb;
    case 'r':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"You have chosen the square root function"<<endl;
        total=sqrt(num1);
        cout<<"Square root of "<<num1<<" is "<<total;
        delay(5000);
        goto lb;
    case 'n':
        cout<<"Enter a number to begin with "<<endl;
        cin>>num1;
        check();
        cout<<"You have chosen permutation and combination"<<endl;
        cout<<"1) Permutation"<<endl;
        cout<<"2) Combination"<<endl;
        int x;
        cin>>x;
        if(x==1)
        {
            cout<<"You have chosen permutation(nPr)"<<endl;
            cout<<"The value of n is "<<num1<<endl;
            cout<<"Please enter the value of r "<<endl;
            cin>>num2;
            check();
            long int total;
            int fact1=1,fact=1;
            for(i=num1; i>1; i--)
            {
                fact=fact*i;
            }
            for(i=num1-num2; i>1; i--)
            {
                fact1=fact1*i;
            }
            total=fact/fact1;
            cout<<"Permutation of the given value is "<<total<<endl;
            delay(5000);
            goto lb;
        }
        else if(x==2)
        {
            cout<<"You have chosen Combination(nCr)"<<endl;
            cout<<"The value of n is "<<num1<<endl;
            cout<<"Please enter the value of r "<<endl;
            cin>>num2;
            check();
            long int total;
            int fact1=1,fact=1,fact2=1;
            for(i=num1; i>1; i--)
            {
                fact=fact*i;
            }
            for(i=num1-num2; i>1; i--)
            {
                fact1=fact1*i;
            }
            for(i=num2; i>1; i--)
            {
                fact2=fact2*i;
            }
            total=fact/(fact1*fact2);
            cout<<"Combination of the given value is "<<total<<endl;
            delay(5000);
            goto lb;
        }
        else
            cout<<"You have entered a wrong choice"<<endl;
        delay(5000);
        goto lb;

    case 'e':
        exit(0);
        break;
    default :
        cout<<"You have entered the wrong operation"<<endl;
        delay(1000);
        goto lb;
    }

    getch();
}
int m1()
{
l1:
    int gd=DETECT,gm;
    initgraph(&gd,&gm,"C:\\TC\\BGI");
    setbkcolor(BLACK);
    setcolor(WHITE);
    settextstyle(2,0,10);
    outtextxy(100,100,"SCIENTIFIC CALCULATOR");
    setcolor(1);
    settextstyle(3,0,2);
    outtextxy(100,155,"Designed By PRAJWAL AND SAURABH");
    setcolor(RED);
    settextstyle(2,0,5);
    outtextxy(200,200,"Please enter the password");
    int flag=1,l;
    char pass[6];
    char r[] = "qwerty";
    for (l=0; l<6; l++)
    {
        pass[l]=getch();
        setcolor(RED);
        outtextxy(220+10*l,220,"*");
    }
    for (l=0; pass[l]!='\b';)
    {
        if(strcmp(pass,r)==1)
            flag=0;
        break;
    }
    if(flag==1)
    {

        setcolor(YELLOW);
        outtextxy(250,250,"ACCESS ABORTED");
        delay(2000);
        cleardevice();
        goto l1;

    }
    else if(flag==0)
    {
        setcolor(GREEN);
        outtextxy(250,250,"ACCESS GRANTED");
        delay(2000);
        cleardevice();
        setcolor(GREEN);
        settextstyle(2,0,10);
        outtextxy(100,100,"SCIENTIFIC CALCULATOR");
        setcolor(GREEN);
    }
    else
        cout<<"";
    void   *buffer;
    unsigned int size;
    line(230,330,370,330);
    line(230,350,370,350);
    line(226,335,226,345);
    line(226,335,230,330);
    line(226,345,230,350);
    line(374,335,374,345);
    line(374,335,370,330);
    line(374,345,370,350);
    settextstyle(2,0,6);
    outtextxy(265,365,"Loading");
    int x=232,y=336,x1=236,y1=344;
    for(int i=1; i<5; i++)
    {
        setfillstyle(1,RED);
        bar(x,y,x1,y1);
        x=x1+2;
        x1=x1+6;
    }
    size=imagesize(232,336,256,344);
    buffer=malloc(size);
    getimage(232,336,256,344,buffer);
    x=232;
    int m=0;
    while(!kbhit())
    {
        putimage(x,336,buffer,XOR_PUT);
        x=x+2;
        if(x>=350)
        {
            m++;
            x=232;
            if(m==5)
                return m;
        }
        putimage(x,336,buffer,XOR_PUT);
        delay(20);

    }

}
void check()
{
    if(cin.fail())
    {
        cin.clear();
        cin.ignore();
        cout<<"Enter a number not any other character"<<endl;
        delay(1000);
        main();
    }
}




