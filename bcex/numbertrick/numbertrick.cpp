#include<iostream>
#include<cstdlib>           //Enable srand() and rand();
#include<ctime>             //Enable time() seed;
using std::cout;
using std::cin;
using std::endl;
void process(int first[9][3], int second[9][3],int min, int max, int index)
{
    for(int i=min,k=0;i<max;i++)
    {
        cout<<"\n";
        for(int j=0;j<3;j++,k++)
        {
            first[i][j]=second[k][index];
            cout<<first[i][j]<<"\t";
        }
    }
}
int main()
{
    srand(time(0));

    int a[9][3],b[9][3],c[9][3],d[9][3];
    cout<<"\t\t\t\tINSTRUCTIONS\n\t\t\t\t------------"<<endl<<
          "\n[1] You have to choose one number and remember it."<<endl<<
          "[2] Enter the COLUMN no when asked.\n[3] ENJOY!!!!!!!!\n\n";
    cout<<"(1)	(2) 	(3)"<<endl;
    for(int i=0;i<9;i++)
    {
        cout<<"\n";
        for(int j=0;j<3;j++)
        {
            a[i][j]=rand()%99+1;
            cout<<a[i][j]<<"\t";
        }
    }
    int col;
    const int minMax[4]={0,3,6,9};                      //Encapsulated your alternating min and max into an array.
    const int index[3][3]={{1,0,2},{0,1,2},{1,2,0}};    //Encapsulated your alternating cols into an array.
    int (*arrys[4])[3] = {a,b,c,d};                     //Encapsulated your alternating arrays into an array.

    for(int i=0;i<3;i++)                                //The three choices taken:
    {
        do
        {
            cout<<"\n\nEnter column no: ";
            cin>>col;

            if((col>3)||(col<1))
                cout<<"Sorry, incorrect input";
            else
                break;                                  //Leaves while-loop, if correct data was entered.
        }while(true);                                   //A never ending while loop, something inside is expected to break it.

        cout<<"\n\n................................................................\n";
        cout<<"(1)	(2) 	(3)"<<endl;
        for(int j=0;j<3;j++)                            //The three cols checked.
        {
            process(arrys[i+1],arrys[i],minMax[j],minMax[j+1],index[col-1][j]);     //Example: process(b,a,0,3,1);
        }
    }
    cout<<"\n\n.................................................................\n";
    cout<<"THE NUMBER CHOSEN IS  "<<d[4][1];
    cout<<"\n.................................................................";
    cout<<"\nPress enter to quit: ";
    cin.get();//Pause, for command line execution.
    return 0;
}
