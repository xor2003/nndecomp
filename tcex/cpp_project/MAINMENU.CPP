#include<iostream.h>
#include<conio.h>
#define o1 gotoxy(31,1);  \
	cout<<"I.R.C.T.C"; \
	gotoxy(25,2);       \
	cout<<"(INDIAN RAILWAY CATERING "; \
	gotoxy(22,3);                       \
	cout<<"AND TOURISM CORPORATION LIMITED)";
void main()
{       int op=1;
	for(;;)
	{	clrscr();
		o1;
		gotoxy(15,6);
		cout<<"-------------------MENU----------------------";
		gotoxy(14,8);
		cout<<"-PASSENGER ZONE -";
		gotoxy(14,10);
		cout<<"-CREATE AN ACCOUNT";   //op=1
		gotoxy(14,11);
		cout<<"-LOGIN";//op=2
		gotoxy(14,12);
		cout<<"-CHECK PNR STATUS"; //op=3
		gotoxy(45,8);
		cout<<"-EMPLOYEE ZONE -";  //
		gotoxy(45,10);
		cout<<"-CREATE AN ACCOUNT";   //op=4
		gotoxy(45,11);
		cout<<"-LOGIN";   //op=5
		gotoxy(14,15);
		cout<<"-EXIT THE PROGRAM"; //op=6
		if(op==1)
			gotoxy(13,10);
		else if(op==2)
			gotoxy(13,11);
		else if(op==3)
			gotoxy(13,12);
		else if(op==4)
			gotoxy(44,10);
		else if(op==5)
			gotoxy(44,11);
		else if(op==6)
			gotoxy(13,15);
		cout<<"->";
		int a=getch();
		if(a==0)
		{       int b=getch();
			if(b==80 && op!=3 && op!=6)
				op++;
			else if(b==80 && op==3)
				op=6;
			else if(b==77 && (op==1 || op==2))
				op+=3;
			else if(b==77 && op==3)
				op=5;
			else if(b==72 && (op==2 || op==3 || op==5))
				op--;
			else if(b==72 && op==6)
				op=3;
			else if(b==75 && (op==4 || op==5))
				op-=3;
		}
		else if(a==13)
			break;
	}
	clrscr();
	cout<<op;
	getch();
}
