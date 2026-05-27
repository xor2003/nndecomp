FILE *f[6];

struct patient
{
   char name[25];
   int id;
   char add[250];
   char tel[11];
   int dtype;
   char dname[25];
};

void add(struct patient *pnt,FILE *fpnt,FILE *fadd)
{
	uname();
	cout<<"Patient's ID       \t:"<<endl;		cin>>pnt->id;
	cout<<"\nName of the Patient\t:"<<endl;		gets(pnt->name);
	cout<<"\nType of Disease    \t:"<<endl;
							list();
							gotoxy(1,12);
							cin>>pnt->dtype;
							clist();
	
	gotoxy(1,13);
	char addd[250];
	cout<<"\nAddress\t\t\t: "
	    <<"\n(please write tidle (~) at the end)"<<endl;
		for(int i=0;i<250;i++)
			{
			addd[i]=getchar();
			if(addd[i]=='~')
				break;
			}
		addd[--i]='\0';
	strcpy(pnt->add,addd);
	fflush(stdin);
	cout<<"\nTelephone Number\t:"<<endl;	    	cin>>pnt->tel;

	if(pnt->dtype==1)
		{
		strcpy(pnt->dname,"Fever");
		f[0]=fopen("FEVER","a+");
		fprintf(f[0]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[0]);
		d[0]++;
		}
	else if(pnt->dtype==2)
		{
		strcpy(pnt->dname,"Cold Virus");
		f[1]=fopen("COLDVIRUS","a+");
		fprintf(f[1]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[1]);
		d[1]++;
		}
	else if(pnt->dtype==3)
		{
		strcpy(pnt->dname,"Yellow Fever");
		f[2]=fopen("YELLOWFEVER","a+");
		fprintf(f[2]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[2]);
		d[2]++;
		}
	else if(pnt->dtype==4)
		{
		strcpy(pnt->dname,"Cholera");
		f[3]=fopen("CHOLERA","a+");
		fprintf(f[3]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[3]);
		d[3]++;
		}
	else if(pnt->dtype==5)
		{
		strcpy(pnt->dname,"Diphtheria");
		f[4]=fopen("DIPHTHERIA","a+");
		fprintf(f[4]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[4]);
		d[4]++;
		}
	else
		{
		strcpy(pnt->dname,"Unknown");
		f[5]=fopen("UNKNOWN","a+");
		fprintf(f[5]," | %4d | %-25s | %-25s | %11s |\n",
			pnt->id,
			pnt->name,
			pnt->dname,
			pnt->tel);
		fclose(f[5]);
		d[5]++;
		}

dtotal++;
fprintf(fpnt," | %4d | %-25s | %-25s | %11s |\n",
		pnt->id,
		pnt->name,
		pnt->dname,
		pnt->tel);
fprintf(fadd,"----------------------------------------------------------------------------------");
fprintf(fadd,"\nPatient ID		:\n%6d\n",pnt->id);
fprintf(fadd,"\nPatient Name		:\n%s\n",pnt->name);
fprintf(fadd,"\nPatient Address		:\n%s\n",pnt->add);
}


void addp(void)
{
struct patient p;
FILE *fp,*fa;
clrscr();
fp=fopen("PATIENT","a+");
fa=fopen("ADDRESS","a+");

char again;

do
{
clrscr();
add(&p,fp,fa);
reask:
gotoxy(20,24);
	space(50);
gotoxy(22,24);
cout<<"Want to add another Patient ? (Y/N) : ";
cin>>again;
if(!(again=='n'||again=='N'||again=='y'||again=='Y'))
{
gotoxy(22,23);
   cout<<"Please enter valid choice character...";
goto reask;
}
}while(again=='y'||again=='Y');

fclose(fp);
fclose(fa);
}
