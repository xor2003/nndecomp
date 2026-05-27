void status(void)
{
count();
clrscr();
uname();
gotoxy(25,7);
line(30,'*');
gotoxy(32,8);
cout<<"PATIENTS' STATUS";
gotoxy(25,9);
line(30,'*');

gotoxy(28,11);
cout<<"1. Fever          : "<<setw(4)<<d[0];
gotoxy(28,12);
cout<<"2. Cold Virus     : "<<setw(4)<<d[1];
gotoxy(28,13);
cout<<"3. Yellow Fever   : "<<setw(4)<<d[2];
gotoxy(28,14);
cout<<"4. Cholera        : "<<setw(4)<<d[3];
gotoxy(28,15);
cout<<"5. Diphtheria     : "<<setw(4)<<d[4];
gotoxy(28,16);
cout<<"6. UNKNOWN        : "<<setw(4)<<d[5];
gotoxy(28,17);
cout<<"Total Patients    : "<<setw(4)<<dtotal;

delay(1000);
gotoxy(26,23);
cout<<"Press Any Key to Continue....";

getch();
}
