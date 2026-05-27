/*--------------*/
/*Array Diemnsi2*/
/*--------------*/

#include <conio.h>
#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>

main()
{
int i,j;
int data_jual[4][4];
clrscr();
for(i=1;i<=3;i++)
{
for(j=1;
j<=3;j++)
{
cout<<"Datra ke - "<<i<<" "<<j<<endl;
cout<<"Jumlah Penjualan:";
cin>>data_jual[i][j];
}
}
cout<<"Data Penjualan Pertahun"<<endl;
cout<<"-----------------"<<endl;
cout<<"NO 2007 2008 2003"<<endl;
cout<<"-----------------"<<endl;
for(i=1;i<=3;i++)
{
cout<<setiosflags(ios::left)<<setw(5)<<i;
for(j=1;j<=3;j++)
{
cout<<setiosflags(ios::right)<<setw(4);
cout<<data_jual[i][j];
cout<<" ";
}
cout<<endl;
}
cout<<"-----------------------"<<endl;
getch();
}
