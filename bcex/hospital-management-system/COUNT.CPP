void count(void)
{
clrscr();
FILE *alist;
char c;
int fc=0;

alist=fopen("FEVER","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[0]=fc-3;
fclose(alist);
fc=0;
alist=fopen("COLDVIRUS","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[1]=fc-3;
fclose(alist);
fc=0;
alist=fopen("YELLOWFEVER","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[2]=fc-3;
fclose(alist);
fc=0;
alist=fopen("CHOLERA","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[3]=fc-3;
fclose(alist);
fc=0;
alist=fopen("DIPHTHERIA","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[4]=fc-3;
fclose(alist);
fc=0;
alist=fopen("UNKNOWN","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
d[5]=fc-3;
fclose(alist);
fc=0;
alist=fopen("PATIENT","r");
while((c=getc(alist)) != EOF)
	{
	if(c=='\n')
		++fc;
	}
dtotal=fc-3;
fclose(alist);

}