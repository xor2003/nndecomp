#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
class idc
{	private:
		int i;
	public:
		idc()
		{
		}
		idc(int a)
		{	i=a;
		}
		int ret_id()
		{	return i;
		}
};
class pnrc
{	private:
		int pn;
	public:
		pnrc()
		{
		}
		pnrc(int a)
		{	pn=a;
		}
		int ret_pnr()
		{	return pn;
		}
};
class tic
{	private:
		char tname[50],s_st[4],e_st[4];
		int pnr,id_c;
		void enter_pnr()
		{	ofstream f("pnr.dat",ios::binary|ios::app);
			pnrc ob(pnr);
			f.write((char *)&ob,sizeof(ob));
			f.close();
		}
		void create_pnr();
	public:
		tic(int a)
		{	id_c=a;
		}
		void create()
		{	gets(tname);
			gets(s_st);
			gets(e_st);
			create_pnr();
		}
		int ret_pnr()
		{	return pnr;
		}
};
void tic::create_pnr()
{	ifstream f("pnr.dat",ios::binary);
	pnrc ob;
	int flag;
	do
	{       flag=0;
		randomize();
		pnr=random(10000);
		while(f.read((char *)&ob,sizeof(ob)))
		{	if(ob.ret_pnr()==pnr)
			{	flag=1;
				break;
			}
		}
	}while(flag==1 || pnr<=999);
	f.close();
	enter_pnr();
}

void main()
{
}


