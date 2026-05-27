#define MAX_INPUT_LEN 79

char inputbuf[MAX_INPUT_LEN+1];
int x=3,tr=20,input_pos=0,bmk=0,x_pos=0;
char na[40],t;
const int MAX_BUF_LEN = 79;
int MAX_LINES_IN_EDIT = 100;

int sent (int);

class CNode
{
	char m_buffer[MAX_BUF_LEN + 1];
	CNode * m_next;
	public:
		CNode (char*);
		void set (char*);
		int setEx (char*);
		void get (char*);
		int setnext (CNode*);
		void deleteNext ();
		void append (CNode*);
		void print (int bRecursive);
		int length ();
		CNode * getnode (int i);
		void insert (CNode*);
		CNode * read_into_file (char*);
		void write_into_file (char*);
		void display (int);
		void erase();


};

CNode *open_file(char *);
CNode * pGhead= NULL;

void CNode:: get (char* p)
{
	strcpy (p,m_buffer);
}

int CNode:: length ()
{
	int i = 1;
	CNode* cur_node = m_next;
	while (cur_node != NULL)
	{
		cur_node=cur_node -> m_next;
		i++;
	}
	return i;
}

CNode * CNode:: getnode (int i)
{
	CNode * cur_node=this;

	for(int k=0;k<i;k++)
	{
	       if(cur_node==NULL) return cur_node;
	       cur_node=cur_node -> m_next;

	}

	return  cur_node;

}

CNode:: CNode (char * a)
{
	set (a);
	m_next=NULL;
}

void CNode:: append (CNode* pNode)
{
	CNode * pTail=this;

	while(pTail->m_next)
	{
		pTail=pTail->m_next;

	}

	pTail->m_next = pNode;

}

int CNode:: setEx (char* a)
{
	int flag=0;

	for (int i = MAX_BUF_LEN-1; i >= 0 && flag==0; i--)
	{
		if  (m_buffer[i] == ' ')
			m_buffer [i] = 0;
		else
			flag=1;
	}

	for (int k = MAX_BUF_LEN-1; k >= 0 && flag==1; k--)
	{
		if  (a[i] == ' ')
			a [i] = 0;
		else
			flag=0;
	}

	if ((strlen (m_buffer) + strlen (a) <= MAX_BUF_LEN))
	{
		_fstrcat (m_buffer, a);
		return i+2;
	}
	else
	{
		int kl = strlen (m_buffer);
		strncpy(m_buffer+kl,a,MAX_BUF_LEN-kl);
		m_buffer[MAX_BUF_LEN] = '\0';
		return kl;
	}

}

void CNode:: set (char* a)
{
	for (int i = 0; i < MAX_BUF_LEN; i++)
		m_buffer[i] = ' ';

	m_buffer[MAX_BUF_LEN] = '\0';

	if (a && strlen (a) <= MAX_BUF_LEN)
	{
		strcpy (m_buffer, a);
		m_buffer[strlen(m_buffer)]=' ';
	}

}

int CNode:: setnext (CNode* k)
{
	if (!m_next)
	{
		m_next = k;
		return 1;
	}
	return 0;
}

void CNode:: print (int bRecursive)
{
	cout << m_buffer << endl;

	if (m_next && bRecursive)
		m_next->print (bRecursive);

}

void CNode:: insert (CNode * P)
{
	P->m_next=m_next;
	m_next=P;
}

void CNode:: deleteNext ()
{
	CNode* P = m_next;
	m_next = m_next->m_next;
	delete P;
}
void CNode:: erase()
{
      CNode * pHead = this;
      while(pHead!=NULL)
      {
	    CNode * P = pHead;
	    pHead=pHead->m_next;
	    delete P;

      }


}
CNode *  CNode:: read_into_file (char * na)
{
	char ch[99];
	CNode* pHead;
	pHead=NULL;

	fstream Note(na,ios::in);

	while(!Note.eof())
	{
		Note.getline(ch,98);
		ch[MAX_INPUT_LEN - 1]=0;
		CNode* pNode = new CNode (ch);
		if(!pHead)
			pHead = pNode;
		else
			pHead->append (pNode);

	}

	Note.close();

	return pHead;

}
void CNode:: write_into_file (char * x)
{

	CNode* pTail;
	pTail = this;

	fstream Note(x,ios::out);
	while(pTail!=NULL)
	{
		Note<<pTail->m_buffer<<'\n';
		pTail = pTail-> m_next;

	}

	Note.close();

}

void heading (char * k)
{
	setfillstyle(SOLID_FILL,7);
	bar(0,0,640,20);
	setcolor(0);
	rectangle(0,0,640,20);
	rectangle(1,1,639,19);
	settextstyle(DEFAULT_FONT,0,0);
	if(strlen(k)==0)
	{
	       outtextxy(10,5,"brOS");
	}
	else
	{
		outtextxy(10,5,k);
	}
	setfillstyle(SOLID_FILL,15);
	bar(0,20,640,480);
	setfillstyle(SOLID_FILL,8);
	bar(0,20,3,480);

}

void CNode:: display (int flag)
{
	setfillstyle(SOLID_FILL,15);
	bar(0,20,640,480);
	setfillstyle(SOLID_FILL,8);
	bar(0,20,3,480);

	if (flag)
		line(1+3,tr+8,4+3,tr+8);

	CNode * pTail = this;
	int y1 = 20;

	while(pTail!=NULL)
	{
		setcolor(0);
		outtextxy(x,y1,pTail->m_buffer);
		pTail = pTail->m_next;
		y1+=8;
	}

	if (flag)
		tr=20;

}

int first_page ()
{

	int flag=0;
	setfillstyle(SOLID_FILL,8);
	bar(0,0,640,840);
	settextstyle(SANS_SERIF_FONT,0,4);
	setcolor(15);
	outtextxy(250,40,"Notepad");
	settextstyle(SANS_SERIF_FONT,0,1);
	outtextxy(80,150,"If you want to use the application enter 1.");
	outtextxy(80,170,"If you want to exit notepad enter 2.");
	outtextxy(80,400,"Press enter key once the option is given.");
	outtextxy(80,420,"To modify your option use backspace.");
	while(!flag)
	{
		outtextxy(100,240,"Enter the option of your choice: ");
		char ch[1];
		ch[0]= getch();
		ch[1]='\0';
		outtextxy(390,240,ch);

		if(getch()!=13)
		{
			setcolor(8);
			outtextxy(390,240,ch);
			setcolor(15);

		}
		else    if(ch[0]=='2')
			{
				return 0;
			}
			else 	if(ch[0]=='1')
				{
					delay(800);
					int k=1;
					outtextxy(100,270,"Enter file name:") ;
					outtextxy(100,290,"If you want a new file just press Enter key.");
					do
					{
						int check=1;
						for(int b=0;check;)
						{
							char buf=getch();
							switch(buf)
							{
								case 8: if(b)
									{
										setcolor(8);
										outtextxy(390,270,na);
										na[--b]=0;
										setcolor(15);
										outtextxy(390,270,na);
									}break;
								case 13: check=0;break;
								default: if(b<40-1 && buf>=' ' && buf<='~')
									{
										na[b]=buf;
										na[++b]=0;
										outtextxy(390,270,na);
									 }

							}

						}
						na[b]='\0';
						pGhead = open_file(na);
						if(pGhead==NULL)
						{
							outtextxy(100,320,"The file given doesn't exist.");
							outtextxy(100,340,"Please enter new file name.");
							delay(100);
							setcolor(8);
							outtextxy(390,270,na);
							setcolor(15);
						}
						else
						{
							setcolor(8);
							outtextxy(100,320,"The file given doesn't exist");
							outtextxy(100,340,"Please enter new file name");
							k=0;
							setcolor(15);
							outtextxy(100,320,"Enjoy Editing!");
							outtextxy(100,340,"NOTE: To exit edit mode press ESCAPE KEY.");
							delay(4000);
							return 1;
						}

					}while(k);

					delay(600);
					flag=1;
				}
					else
					{
						setcolor(8);
						outtextxy(390,240,ch);
						setcolor(15);

					}

	}
		setcolor(0);
		return 0;

}

CNode* open_file (char* na)
{
	// If a  new file then create an empty Linked List
	if (na == NULL || strlen (na) == 0)
	{
		CNode* pHead = new CNode ("");
		for (int i = 0; i < MAX_LINES_IN_EDIT; i++)
		{
			CNode* N = new CNode ("");
			pHead->append (N);
		}
		return pHead;
	}
	else
	{
		{
			fstream Note(na,ios::in);
			if(!Note)
				return NULL;//Invalid File
		}
		// Coast is clear. Read in the file into the Link List...
		CNode C("");
		CNode *pHead= C.read_into_file(na);
		if (pHead)
		{
			int len = pHead->length ();
			if (len < MAX_LINES_IN_EDIT)
			{      for(int i=len;i < MAX_LINES_IN_EDIT;i++)
			       {
				CNode * e= new CNode("");
				pHead->append (e);
			       }

			}
		}
		return pHead;

	}

}
int savefile()
{
	int flag=0;
	while(!flag)
	{
		outtextxy(80,230,"Do you want to save your file? (Y/N): ");
		char ch[1];
		ch[0]= getch();
		ch[1]='\0';
		outtextxy(540,240,ch);

		if(getch()!=13)
		{
			setcolor(8);
			outtextxy(540,240,ch);
			setcolor(15);

		}
		else if(ch[0]=='Y'|| ch[0]=='y')
		     {
			 return 1;

		     }
		     else if(ch[0]=='N'|| ch[0]=='n')
			  {
			     return 0;

			  }

	}
	      return 0;

}
int initeditor ()
{
	initmouse();
	i.x.ax=2;
	setcolor(BLACK);
	int exit_check=first_page();
       // pGHead is Initialized
	if(exit_check)
	{
		heading(na);
		pGhead->display (1);
		while(sent(bioskey(0)));
	}
	else
	{
		return 0;
	}
	setfillstyle(1,8);
	bar(0,0,640,480);
	setcolor(15);
	settextstyle(1,0,2);
	int jeck=savefile();
	if((na==NULL || strlen(na)==0) && jeck)
	{

		setfillstyle(1,8);
		bar(0,0,640,480);
		setcolor(15);
		settextstyle(1,0,2);
		outtextxy(140,200,"Save file as:");
		settextstyle(1,0,2);
		outtextxy(240,300,"- Notepad -");

		  int b = 0;
		  bmk=1;

		  do
		  {
			int check=1;
			char buf=getch();
			switch(buf)
			{
				case 8: if(b)
					{
						setcolor(8);
						outtextxy(300,200,na);
						na[--b]=0;
						setcolor(15);
						outtextxy(300,200,na);

					}break;

				case 13: check=0;break;

				default: if(b<40-1 && buf>=' ' && buf<='~')
					 {
						na[b]=buf;
						na[++b]=0;
						outtextxy(300,200,na);

					  }
			}


			na[b]='\0';

			if(strlen(na)==0)
			{
				setcolor(15);
				outtextxy(200,260,"Please give a name to your file.");
				delay(100);
				bmk=1;
				b=0;
				check = 1;
			}
			else
			{
				if (!check)
				{
					setcolor(8);
					outtextxy(200,260,"Please give a name to your file.");
					setcolor(15);
					outtextxy(200,260,"Your file has been saved.");
					check = 1;
					bmk = 0;

				}

			}

		  } while(bmk);


	}
	delay(150);
	if(jeck)
	{
		pGhead->write_into_file(na);
	}
	pGhead->erase();
	pGhead=NULL;

	return 0;
}
int gettextwidth (char * buff , int pos)
{
	char t_buff[MAX_INPUT_LEN+1];

	for(int i=0;i<pos;i++)
	{
		t_buff[i]=buff[i];
	}

	t_buff[i]='\0';

		return textwidth(t_buff);

}

void moveright ()
{
	if(input_pos<78)
	{
	  input_pos++;
	  setcolor(15);
	  line(bmk+1+3,tr+8,bmk+4+3,tr+8);
	  bmk = gettextwidth(inputbuf,input_pos);

	}

}

void moveleft ()
{
	if(input_pos>0)
	{
		input_pos--;
		setcolor(15);
		line(bmk+1+3,tr+8,bmk+4+3,tr+8);
		bmk = gettextwidth(inputbuf,input_pos);

	}

}

void moveup (int &p,int &q)
{
	if(tr>20)
	{
		setcolor(15);
		line(p+1+3,q+8,p+4+3,q+8);
		q-=8;

	}


}

void movedown (int &p,int &q)
{
       if(tr<460)
       {
		setcolor(15);
		line(p+1+3,q,p+4+3,q);
		q+=8;

       }

}

int sent(int c)
{


	CNode * N= pGhead->getnode((tr-20)/8);
	N->get(inputbuf);

	setcolor(15);line(bmk+1+3,tr+8,bmk+4+3,tr+8);
	setcolor(0);

	bmk=gettextwidth(inputbuf,input_pos);



		if(char(c)==8)
		{
		  if(input_pos-1!=-1)
			 {
				setcolor(15);
				line(bmk+1+3,tr+8,bmk+4+3,tr+8);
				outtextxy(x,tr,inputbuf);
				inputbuf[--input_pos] = 0;
				setcolor(0);
				bmk=textwidth(inputbuf);
				inputbuf[input_pos]=' ';
				inputbuf[MAX_INPUT_LEN-1]='\0';

				for(int i=input_pos ; i<MAX_INPUT_LEN-2;i++)
					inputbuf[i]=inputbuf[i+1];

				outtextxy(x,tr,inputbuf);

				CNode * N= pGhead->getnode((tr-20)/8);
				N->set(inputbuf);
				inputbuf[input_pos]='\0';

			 }
			 else
			 {
				if(tr > 20)
				{
					tr-=8;
					CNode * N= pGhead->getnode((tr-20)/8);
					input_pos=N->setEx (inputbuf);
					N->deleteNext ();
					pGhead->display (0);
					N->get (inputbuf);
					if(input_pos)
						inputbuf[input_pos]=0;
					else
					{
						for(int o=MAX_INPUT_LEN-1;inputbuf[o]==' ';o--);
						input_pos = o+1;

					}
					bmk=textwidth(inputbuf);

				}

			 }
		  }

		else if(char(c)==13)
		{
			 if(input_pos>0)
			 {

				CNode * P=new CNode(inputbuf+input_pos);
				N->insert(P);
				inputbuf[input_pos]=0;
				N->set(inputbuf);

			 }
			 tr+=8;
			 setcolor(15);
			 line(bmk+1+3,tr,bmk+4+3,tr);
			 input_pos=0;
			 bmk=0;
			 pGhead -> display(0);
		}

		else if(char(c)==27)
		{
			inputbuf[0]=0;
			return 0;
		}

		else if(c==18432) {outtextxy(x,tr,inputbuf);moveup(bmk,tr);}

		else if(c==20480) {outtextxy(x,tr,inputbuf);movedown(bmk,tr);}

		else if(c==19200) {outtextxy(x,tr,inputbuf);moveleft();}

		else if(c==19712) {outtextxy(x,tr,inputbuf);moveright();}

		else
		{
			  char cf = c;
			  if ( cf >= ' ' && cf <= '~')
			  {
				if(input_pos<=MAX_INPUT_LEN-2)
				{
					setcolor(15);
					line(bmk+1+3,tr+8,bmk+4+3,tr+8);
					outtextxy(x,tr,inputbuf);
					setcolor(0);
					char e=inputbuf[input_pos];
					inputbuf[input_pos]=cf;
					input_pos++;
					char t=inputbuf[input_pos];
					inputbuf[input_pos]=0;bmk=textwidth(inputbuf);
					inputbuf[input_pos]=e;
					inputbuf[MAX_INPUT_LEN-1]='\0';

					if (input_pos+1 <= MAX_INPUT_LEN-2)
					{
						for(int i=MAX_INPUT_LEN-2 ; i>input_pos+1;i--)
							inputbuf[i]=inputbuf[i-1];
						inputbuf[input_pos+1]=t;
					}

					outtextxy(x,tr,inputbuf);
					CNode * N= pGhead->getnode((tr-20)/8);
					N->set(inputbuf);
					inputbuf[input_pos]=0;
				}
				else
				{
					tr+=8;input_pos=0;
					bmk = 0;
					CNode * N= pGhead->getnode((tr-20)/8);
					N->get(inputbuf);
					setcolor(15);
					outtextxy(x,tr,inputbuf);
					char e=inputbuf[input_pos];
					inputbuf[input_pos]=cf;
					input_pos++;
					char t=inputbuf[input_pos];
					inputbuf[input_pos]=0;bmk=textwidth(inputbuf);
					inputbuf[input_pos]=e;
					inputbuf[MAX_INPUT_LEN-1]='\0';
					if (input_pos+1 <= MAX_INPUT_LEN-2)
					{
						for(int i=MAX_INPUT_LEN-2 ; i>input_pos+1;i--)
							inputbuf[i]=inputbuf[i-1];
						inputbuf[input_pos+1]=t;
					}

					setcolor(0);
					outtextxy(x,tr,inputbuf);
					N= pGhead->getnode((tr-20)/8);
					N->set(inputbuf);
					inputbuf[input_pos]=0;

				}

			  }
		}




	setcolor(0);
	line(bmk+1+3,tr+8,bmk+4+3,tr+8);


		return 1;
}
//THE END