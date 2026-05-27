#include <conio.h>
#include <fstream.h>
#include <ctype.h>
#include <stdio.h>
#include <graphics.h>
#include <conio.h>
#include <dos.h>
#include <string.h>
#include <stdlib.h>

class Billing
{
	public:  		//All public for Program efficiency
		float price;
		unsigned long int id;
		char name[20];
		Billing()
		{
			id=0;
			price=0;
			strcpy(name,"NOT FOUND");
		}
		void input()             //Input into OBJ
		{
		       cout<<"\n\t\t Input ";
		       cout<<"\n\t\t=========\n";
		       cout<<"ID:";	cin>>id;
		       cout<<"Name:";	gets(name);
		       cout<<"Price:";	cin>>price;
		}
		void output()                            //Output from OBJ
		{
			cout<<"\n\t\t Output ";
			cout<<"\n\t\t=========\n";
			cout<<"ID:"<<id<<"\n";
			cout<<"\nName: ";
			puts(name);
			cout<<"Price: Rs "<<price;

		}


};


void Borders()		//To draw borders
{
	cleardevice();
	setfillstyle(SOLID_FILL,RED);
	bar(0,0,getmaxx(),10);
	setfillstyle(SOLID_FILL,BLUE);
	bar(0,getmaxy()-10,getmaxx(),getmaxy());
}




void DataIN()		//Input DataBase
{
	ofstream item("DataBase.dat",ios::binary|ios::app);
	Billing obj;

	obj.input();
	item.write((char*)&obj,sizeof(obj));
	item.close();

}




Billing DataCHECK(unsigned long int id)      //Check for existing data
{
	unsigned long int temp_id;
	ifstream item("DataBase.dat",ios::binary);
	Billing obj,obj1;	//Obj1 is 'NULL OBJECT'
	item.seekg(0,ios::beg);
	for(int i=0;i>=0;i++)
	{	item.read((char*)&obj,sizeof(obj));
		temp_id=obj.id;
		if(temp_id==id)
		{
			cout<<"\nMatched ID: "<<temp_id;
			item.close();
			return obj;
		}
	}
	item.close();
	return obj1;
}

void bill()
{
	float sum=0,price[20];
	char ch='y',name[20][20];
	Billing obj;
	unsigned long int temp_id;

	for(int i=0;ch=='y';i++)
	{       Borders();
		clrscr();
		cout<<"\n\t\t Billing";
		cout<<"\n\t\t=========";
		cout<<"\nEnter ID: ";
		cin>>temp_id;
		obj=DataCHECK(temp_id);
		sum+=obj.price;
		price[i]=obj.price;
		strcpy(name[i],obj.name);
		cout<<"\n\n More Products ? (Y/N):";
		cin>>ch;
		tolower(ch);
	}
	clrscr();
	cout<<"\n\t\t Summary";
	cout<<"\n\t\t=========\n";
	for(int j=0;j<i;j++)
	{       Borders();
		cout<<"\t"<<name[i]<<"\t\tRs."<<price[i]<<endl;
	}
	cout<<"\n\n\nTotal Bill: Rs."<<sum;
	cout<<"\n\nPress Any key to exit....";
	getch();
}

void main()	//Contains menu
{
	int choice;unsigned long int a;Billing obj;
	X:clrscr();
	int gd= DETECT, gm, err,i;
	initgraph(&gd, &gm, "C:\\TC\\BGI");
	Borders();
	cout<<"\n\t\t\t SuperMarket Database Management ";
	cout<<"\n\t\t\t===================================\n";
	cout<<"\t1.Enter Data into database (*)"<<endl;
	cout<<"\t2.Verify with Database (*)"<<endl;
	cout<<"\t3.Billing"<<endl;
	cout<<"\t4.Exit (*)"<<endl<<"\n\n\tEnter Any Choice: ";
	//Borders();
	cin>>choice;
	switch(choice)
	{
		case 1: DataIN();break;
		case 2: cout<<"\n\tEnter Item Id to be verified:";
			cin>>a;obj=DataCHECK(a);
			obj.output();break;
		case 3: bill();break;
		case 4: exit(0);
		default:cout<<"\tInvalid Input....";getch();goto X;
	 }
	 getch();
	 goto X;
}
