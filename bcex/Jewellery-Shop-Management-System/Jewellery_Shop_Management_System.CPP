#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<string.h>
char user[20];
char p[5];
void main_head();
void home();
void store_head();

class date
{
  char da[11];
  public:
  void in()
  {
    cout<<"Enter Today's Date(DD/MM/YYYY): ";
    gets(da);
  }
  void out()
  {
    cout<<"Date: ";
    puts(da);
  }
  char* get_da()
  {
    return da;
  }
}dt;

class curr_rate
{
  float gold;
  float silver;
  public:
  float goldrate()
  {
    return gold;
  }
  float silverrate()
  {
    return silver;
  }
  void set_srate(float s)
  {
    silver=s;
  }
  void set_grate(float g)
  {
    gold=g;
  }
}cr;

class item
{
  char name[20];
  float weight;
  char metal[10];
  int quantity;
  float make_charge;
  float wastage;
  float cost_price;
  float rate_purch;
  float weight_bought;
  float price;
  public:
  void calc_price()
  {
    if(strcmpi("Gold",metal)==0)
    {
      price=((weight+((wastage/100)*weight))*cr.goldrate())+make_charge;
    }
    else
      price=(weight*cr.silverrate())+make_charge;
  }
  void calc_cost()
  {
    cost_price=(weight_bought/100.0*weight)*rate_purch;
  }
  void makeSale()
  {
    quantity-=1;
  }
  char* get_name()
  {
    return name;
  }
  float get_weight()
  {
    return weight;
  }
  char* get_metal()
  {
    return metal;
  }
  int get_quantity()
  {
    return quantity;
  }
  float get_make_charge()
  {
    return make_charge;
  }
  float get_wastage()
  {
    return wastage;
  }
  float get_costprice()
  {
    return cost_price;
  }
  float get_rate_purch()
  {
    return rate_purch;
  }
  float get_weight_bought()
  {
   return weight_bought;
  }
  float get_price()
  {
    return price;
  }
  void set_quantity(int q)
  {
    quantity=q;
  }
  void increase_q(int q)
  {
    quantity+=q;
  }
  void init()
  {
    cout<<"Enter Details of the Item.";
    cout<<"\nName: ";
    gets(name);
    cout<<"Weight: ";
    cin>>weight;
    cout<<"Metal: ";
    gets(metal);
    cout<<"Stock: ";
    cin>>quantity;
    cout<<"% Wastage: ";
    cin>>wastage;
    cout<<"Making Charge: ";
    cin>>make_charge;
    cout<<"Weight % at which you bought: ";
    cin>>weight_bought;
    cout<<"Rate at which you bought: ";
    cin>>rate_purch;
    calc_price();
    calc_cost();
  }
  void outit()
  {
    cout<<"\nItem Details: ";
    cout<<"\nName: ";
    puts(name);
    cout<<"Weight: "<<weight;
    cout<<"\nMetal: ";
    puts(metal);
    cout<<"Stock: "<<quantity;
    cout<<"\n% Wastage: "<<wastage;
    cout<<"\nMaking Charge: "<<make_charge;
    cout<<"\nWeight % at which you bought: "<<weight_bought;
    cout<<"\nRate at which you bought: "<<rate_purch;
    calc_price();
    calc_cost();
    cout<<"\nCost Price: "<<cost_price;
    cout<<"\nSale Price: "<<price;
  }
};

class Store
{
  char store[30], year[20], email[30], uname[20], phone[11], pin[5];
  float cashOnHand;
  public:
  Store()
  {
    cashOnHand=0.0;
  }
  char* get_store()
  {
    return store;
  }
  char* get_year()
  {
    return year;
  }
  char* get_email()
  {
    return email;
  }
  char* get_uname()
  {
    return uname;
  }
  char* get_phone()
  {
    return phone;
  }
  char* get_pin()
  {
    return pin;
  }
  int getCurrentBalance()
  {
    return cashOnHand;
  }
  void setCurrentBalance(int e)
  {
    cashOnHand=e;
  }
  void set_store(char s[])
  {
    strcpy(store,s);
  }
  void set_year(char y[])
  {
    strcpy(year,y);
  }
  void set_email(char e[])
  {
    strcpy(email,e);
  }
  void set_uname(char u[])
  {
    strcpy(uname,u);
  }
  void set_phone(char p[])
  {
    strcpy(phone,p);
  }
  void set_pin(char p[])
  {
    strcpy(pin,p);
  }
  void acceptAmount(int a)
  {
    cashOnHand+=a;
  }
};

class customer
{
  char chhh;
  char name[20];
  char phone[14];
  char address[20];
  char email[20];
  float balae;
  public:
  customer()
  {
    balae=0.0;
  }
 char* get_name()
 {
  return name;
 }
 void set_name(char n[])
 {
  strcpy(name,n);
 }
 float get_balae()
 {
   return balae;
 }
 void set_balae(float b)
 {
   balae=b;
 }
 void increase_balae(float b)
 {
   balae+=b;
 }
 void decrease_balae(float b)
 {
   balae-=b;
 }
 char* get_phone()
 {
   return phone;
 }
 void set_phone(char p[])
 {
  strcpy(phone,p);
 }
 char* get_address()
 {
  return address;
 }
 void set_address(char a[])
 {
  strcpy(address,a);
 }
 char* get_email()
 {
  return email;
 }
 void set_email(char e[])
 {
  strcpy(email,e);
 }
 void inc()
 {
  cout<<"Enter the customer's details:";
  cout<<"\nName: ";
  gets(name);
  cout<<"Phone: ";
  gets(phone);
  cout<<"Address: ";
  gets(address);
  cout<<"Email Id: ";
  gets(email);
 }
 void outc()
 {
  cout<<"Customer's details:";
  cout<<"\nName: ";
  puts(name);
  cout<<"Phone: ";
  puts(phone);
  cout<<"Address: ";
  puts(address);
  cout<<"Email Id: ";
  puts(email);
  cout<<"Balance: "<<balae;
 }
};

class salec:public customer, public item, public Store
{
  public:
  char cname[20];
  char items[20][20], metal[20][20];
  int invoiceno, quan[20], k, j;
  float weigh[20],wastag[20],make_charg[20];
  float pric[20];
  float total[20], subtotal;
  float received;
  float balance;
  salec()
  {
    k=0;
    j=0;
    invoiceno=0;
    subtotal=0.0;
    balance=0.0;
  }

  int get_invoiceno()
  {
    return invoiceno;
  }
  char* get_cname()
  {
   return cname;
  }
  void set_cname(char c[])
  {
   strcpy(cname,c);
  }
  void ins()
  {
  cout<<"Customers name"<<customer::get_name();
  }
  }
;

void show_sale(salec s)
 {
   int l,m,n;
   cout<<"\n\nInvoice No.: "<<s.invoiceno;
   dt.out();
   cout<<"\n#\tItem\tMetal\tWeight\tWast.\tMak.";
   cout<<"\tPrice\tQty.\tTotal\n";
	    for(l=1;l<=s.k;l++)
	    {
	      cout<<l<<"\t";
	      for(m=0;s.items[l-1][m]!='\0';++m)
	      {
		cout<<s.items[l-1][m];
	      }
	       cout<<"\t";
	      for(m=0;s.metal[l-1][m]!='\0';++m)
	      {
		cout<<s.metal[l-1][m];
	      }
	      cout<<"\t"<<s.weigh[l-1]<<"\t"<<s.wastag[l-1]<<"\t"<<s.make_charg[l-1];
	      cout<<"\t"<<s.pric[l-1]<<"\t"<<s.quan[l-1]<<"\t"<<s.total[l-1]<<"\n";
	    }

	    cout<<"\nSubtotal: "<<s.subtotal;
	    getch();
}

void cust_menu(customer &cus)
{
  int ch, ex;
  salec s;
  char n[20], ans;
  do{

  cout<<"\n1. Add a customer.";
  cout<<"\n2. Display all customers.";
  cout<<"\n3. Search customer.";
  cout<<"\n4. Delete a customer.";
  cout<<"\n5. Go to Home.";
  cout<<"\nEnter your choice: ";
  cin>>ch;
  switch(ch)
  {
   case 1:    clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      ofstream f2("customers.dat",ios::binary|ios::app);
	      cus.inc();
	      f2.write((char*)&cus,sizeof(cus));
	      f2.close();
	      break;
    case 2:   clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      ifstream f1("customers.dat",ios::binary);
	      while(f1.read((char*)&cus,sizeof(cus)))
	    {
	      puts(cus.get_name());
	    }
	    f1.close();
	    break;
    case 3: clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	       customer c;
	       ifstream f("customers.dat",ios::binary);
	      cout<<"Enter name: ";
	      gets(n);

	    while(f.read((char*)&c,sizeof(c)))
	    {
	     if(strcmpi(n,c.get_name())==0)
	     {
	      c.outc();
	      ifstream f3("sales.dat",ios::binary);
	      while(f3.read((char*)&s,sizeof(s)))
	      {
		if(strcmpi(s.cname,n)==0)
		{
		  show_sale(s);
		}
	      }
	     f3.close();
	     }
	    }
	    f.close();
	   break;

    case 4: clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      ifstream f6("customers.dat",ios::binary);
	    cout<<"Enter name: ";
	    gets(n);
	    ofstream f4("temp.dat",ios::binary);
	    while(f6.read((char*)&cus,sizeof(cus)))
	    {
	     if(strcmpi(n,cus.get_name())!=0)
	     {
	       f4.write((char*)&cus,sizeof(cus));
	     }
	     else
	     {
	       cus.outc();
	       cout<<"\nDo you really wish to delete?(y/n): ";
	       cin>>ans;
	       if(ans=='n')
		f4.write((char*)&cus, sizeof(cus));
	     }
	    }
	    f6.close();
	    f4.close();
	    remove("customers.dat");
	    rename("temp.dat","customer.dat");
	    break;
    case 5: ex=1;
	    break;
    default: cout<<"Invalid Choice!";
	 }
    }
    while(ex!=1);
}

void show_list(salec &s)
{
   int l,m,n;
   if(s.k!=0)
   { cout<<"\n#\tItem\tMet.\tWeight\tWast.\tMak.C.";
     cout<<"\tPrice\tQuant.\tTotal\n";
     cout<<"-----------------------------------------------------------------------\n";
	    for(l=1;l<=s.k;l++)
	    {
	      cout<<l<<"\t";
	      for(m=0;s.items[l-1][m]!='\0';++m)
	      {
		cout<<s.items[l-1][m];
	      }
	       cout<<"\t";
	      for(m=0;s.metal[l-1][m]!='\0';++m)
	      {
		cout<<s.metal[l-1][m];
	      }
	      cout<<"\t"<<s.weigh[l-1]<<"\t"<<s.wastag[l-1]<<"\t"<<s.make_charg[l-1];
	      cout<<"\t"<<s.pric[l-1]<<"\t"<<s.quan[l-1]<<"\t"<<s.total[l-1]<<"\n";
	    }
	    cout<<"\nSubtotal: "<<s.subtotal;
  }
}

void save_bill(salec &s)
{
  ++s.invoiceno;
  int l,m,n;
  Store st;
	    ifstream f2("stores.dat",ios::binary);
	    ofstream f1("Invoice.docx",ios::out);
	    while(f2.read((char*)&st,sizeof(st)))
	    {
	     if((strcmpi(user,st.get_uname())==0)&&(strcmpi(st.get_pin(),p)==0))
	     {
	      f1<<st.get_store();
	      f1<<"\t\t\t\t\t\t\tRates:\n";
	      f1<<st.Store::get_email()<<"\t\t\t\t\t\t\t  Gold: "<<cr.goldrate();
	      f1<<"\n";
	      f1<<st.Store::get_phone()<<"\t\t\t\t\t\t\t\t        Silver: "<<cr.silverrate();
	      f1<<"\nInvoice No.: "<<s.invoiceno<<"\t\t\t\t\t\t\t  Date: "<<dt.get_da()<<"\n";
	     }
	    }
	    f1<<"-----------------------------------------------------------------------\n";
	    f1<<"\t\t\t\t\t   INVOICE\n";
	    f1<<"-----------------------------------------------------------------------\n";
	    f1<<"\n#\tItem\tMetal\tWeight\tWast.\tMak.";
	    f1<<"\tPrice\tQuant.\tTotal\n";
	    f1<<"-----------------------------------------------------------------------\n";
	    for(l=1;l<=s.k;l++)
	    {
	      f1<<l<<"\t";
	      for(m=0;s.items[l-1][m]!='\0';++m)
	      {
		f1<<s.items[l-1][m];
	      }
	       f1<<"\t";
	      for(m=0;s.metal[l-1][m]!='\0';++m)
	      {
		f1<<s.metal[l-1][m];
	      }
	      f1<<"\t"<<s.weigh[l-1]<<"\t"<<s.wastag[l-1]<<"\t"<<s.make_charg[l-1];
	      f1<<"\t"<<s.pric[l-1]<<"\t"<<s.quan[l-1]<<"\t"<<s.total[l-1]<<"\n";
	    }
	    f1<<"\nSubtotal: "<<s.subtotal;
	    cout<<"\nBill Saved in BIN folder.";
}

void add_item(salec &s)
{
  int quant, count=0;
  item i;
  long pos;
  int q,flag=0;
  char itemn[20], ch,c;
  ifstream f1("items.dat",ios::binary);
  cout<<"\nEnter item name: ";
	  gets(itemn);
       while(f1.read((char*)&i,sizeof(i)))
       {
	if(strcmpi(itemn,i.get_name())==0)
	{
	   count++;
	   break;
	}
       }

	if(count==1)
	{
	  label: cout<<"\nEnter quantity: ";
		cin>>quant;
		if(quant>i.get_quantity())
		{
		  cout<<"\nNot enough stock!";
		  cout<<"\nAvailable Stock: "<<i.get_quantity();
		  cout<<"\nDo u want to increase this item's stock?(y/n): ";
		  cin>>c;
		  if(c=='y')
		  { f1.close();
		    fstream f("items.dat",ios::binary|ios::in|ios::out);
		    while(!f.eof())
		    {
		      pos=f.tellg();
		      f.read((char*)&i,sizeof(i));
		      if(strcmpi(i.get_name(),itemn)==0)
		      {
		       cout<<"Enter by how much u want to increase: ";
		       cin>>q;
		       i.increase_q(q);
		       f.seekg(pos);
		       f.write((char*)&i,sizeof(i));
		       cout<<"Stock Updated!";
		       flag=1;
		       break;
		      }
		    }
		    if(flag==0)
		    {
		      cout<<"Item does not exist in stock!";
		    }
		    f.close();
		  }
		}
		else
		{
		  s.quan[s.j]=quant;
		  i.calc_price();
		  s.total[s.j]=i.get_price()*s.quan[s.j];
		  s.subtotal+=s.total[s.j];
		  s.j++;
		  strcpy(s.items[s.k],i.get_name());
		  strcpy(s.metal[s.k],i.get_metal());
		  s.weigh[s.k]=i.get_weight();
		  s.wastag[s.k]=i.get_wastage();
		  s.make_charg[s.k]=i.get_make_charge();
		  s.pric[s.k]=i.get_price();
		  s.k++;
		  f1.close();
		}
	}
	else
	{ cout<<"\nItem does not exist in stock.";
	  cout<<"\nDo u want to add item in stock(y/n): ";
	  cin>>ch;
	  if(ch=='y')
	  {
	    ofstream f2("items.dat",ios::binary|ios::app);
	    i.init();
	    f2.write((char*)&i,sizeof(i));
	    f2.close();
	    cout<<"Item added successfully!";
	    getch();
	    goto label;
	  }
	}
}

void del(salec &s)
{
  salec s1;
  s=s1;
}

void make_payment(int &flag1,salec &s)
{
  float payA, b;
  char ch1;
  item i;
  customer cus;
  int l;
  long pos;
  int a;

  fstream f1("items.dat",ios::binary|ios::out|ios::in);
  fstream f2("customers.dat",ios::binary|ios::out|ios::in);
  label2: cout<<"\nMake Payment(Enter Amount): ";
	  cin>>payA;
	  if(payA==s.subtotal)
	  {
	    s.acceptAmount(payA);
	    a=0;
	    while(!f1.eof())
	    {
	      pos=f1.tellg();
	      f1.read((char*)&i,sizeof(i));
	      if(strcmpi(i.get_name(),s.items[a])==0)
	      {
		 for(l=1;l<=s.quan[a];l++)
		 {
		  i.makeSale();
		 }
		 f1.seekg(pos);
		 f1.write((char*)&i,sizeof(i));
		 ++a;
	      }
	    }
	    f1.close();
	    cout<<"Purchase Successful!!";
	    flag1=1;
	    getch();
	    save_bill(s);
	  }
	  else if(payA>s.subtotal)
	  { s.acceptAmount(payA);
	    a=0;
	    while(!f1.eof())
	    {
	      pos=f1.tellg();
	      f1.read((char*)&i,sizeof(i));
	      if(strcmpi(i.get_name(),s.items[a])==0)
	      {
		 for(l=1;l<=s.quan[a];l++)
		 {
		  i.makeSale();
		 }
		 f1.seekg(pos);
		 f1.write((char*)&i,sizeof(i));
		 ++a;
	      }
	    }
	    f1.close();

	    b=payA-s.subtotal;
	    while(!f2.eof())
	    {
	      pos=f2.tellg();
	      f2.read((char*)&cus,sizeof(cus));
	      if(strcmpi(cus.get_name(),s.cname)==0)
	      {
		 cus.decrease_balae(b);
		 f2.seekg(pos);
		 f2.write((char*)&cus,sizeof(cus));
	      }
	    }
	    f2.close();

	    cout<<"Purchase Successful!!";
	    flag1=1;
	    cout<<"\nExtra adjusted in balance.";
	    getch();
	    save_bill(s);
	  }
	  else
	  {
	    cout<<"Payment is lesser than Subtotal.";
	    cout<<"\nDo u want to add remaining to balance?(y/n): ";
	    cin>>ch1;
	    if(ch1=='y')
	    {
	      s.acceptAmount(payA);
	      a=0;
	     while(!f1.eof())
	     {
	      pos=f1.tellg();
	      f1.read((char*)&i,sizeof(i));
	      if(strcmpi(i.get_name(),s.items[a])==0)
	      {
		 for(l=1;l<=s.quan[a];l++)
		 {
		  i.makeSale();
		 }
		 f1.seekg(pos);
		 f1.write((char*)&i,sizeof(i));
		 ++a;
	      }
	    }
	    f1.close();
	      b=s.subtotal-payA;
	     while(!f2.eof())
	     {
	      pos=f2.tellg();
	      f2.read((char*)&cus,sizeof(cus));
	      if(strcmpi(cus.get_name(),s.cname)==0)
	      {
		 cus.increase_balae(b);
		 f2.seekg(pos);
		 f2.write((char*)&cus,sizeof(cus));
	      }
	     }
	     f2.close();
	      cout<<"Purchase Successful!!";
	      flag1=1;
	      getch();
	      save_bill(s);
	      del(s);
	    }
	    else
	    {
	      goto label2;
	    }
	  }
}

void sale_menu(salec s)
{
  int ex=0, flag1=-1;
  char chh;
  int count=0;
  customer c1;
  s.invoiceno=0;
  ifstream f1("customers.dat",ios::binary);
  cout<<"Enter Customer's Name: ";
  gets(s.cname);
  while(f1.read((char*)&c1,sizeof(c1)))
  {
   if(strcmpi(s.cname,c1.get_name())==0)
    { count++;
      if(count==1)
      { break;
      }
    }
  }
  f1.close();
   if(count==1)
   {
    do{
     cout<<"\n1. Add item to bill.";
     cout<<"\n2. Accept Payment.";
     cout<<"\n3. Go to Home.";
     cout<<"\nEnter your choice.";
     chh=getch();
     switch(chh)
     {
      case '1': clrscr();
		main_head();
		store_head();
		cout<<"\n\n\n\n";
		add_item(s);
		show_list(s);
		break;
      case '2': clrscr();
		main_head();
		store_head();
		cout<<"\n\n\n\n";
		make_payment(flag1,s);
		if(flag1==1)
		{
		  ofstream f("sales.dat",ios::binary|ios::app);
		  f.write((char*)&s,sizeof(s));
		  f.close();
		  del(s);
		  getch();
		}
		break;
      case '3': ex=1;
		del(s);
		break;
      default: cout<<"Invalid Choice!";
     }
    }
    while(flag1!=1&&ex!=1);
   }
   else
   {
      cout<<"Customer Not Found! Go to Home and add Customer.";
   }
}
void item_menu(item &it)
{
  int q, flag=0;
  int ch, ex;
  char n[20], ans;
  salec s;
  long pos;
  do{
    clrscr();
    main_head();
    store_head();
    cout<<"\n\n\n\n";
  ifstream f1("items.dat",ios::binary);
  ofstream f2("items.dat",ios::binary|ios::app);
  cout<<"\n1. Add an item.";
  cout<<"\n2. Display all items.";
  cout<<"\n3. Search an item.";
  cout<<"\n4. Increase Stock.";
  cout<<"\n5. Delete an item.";
  cout<<"\n6. Go to Home.";
  cout<<"\nEnter your choice: ";
  cin>>ch;
  switch(ch)
  {
    case 1: clrscr();
	    main_head();
	    store_head();
	    cout<<"\n\n\n\n";
	    it.init();
	    f2.write((char*)&it,sizeof(it));
	    f1.close();
	    f2.close();
	    cout<<"Item added successfully!";
	    getch();
	    break;
    case 2: clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	    while(f1.read((char*)&it,sizeof(it)))
	    {
	      puts(it.get_name());
	    }
	    getch();
	    f1.close();
	    f2.close();
	    break;
    case 3: clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	    cout<<"Enter name: ";
	    gets(n);
	    while(f1.read((char*)&it,sizeof(it)))
	    {
	     if(strcmpi(n,it.get_name())==0)
	     {
	      it.outit();
	     }
	    }
	    getch();
	    f1.close();
	    f2.close();
	    break;
    case 4: clrscr();
	    main_head();
	    store_head();
	    f1.close();
	    f2.close();
	    cout<<"\n\n\n\n";
	    cout<<"Enter name: ";
	    gets(n);
	    item i;
	    fstream f("items.dat",ios::binary|ios::in|ios::out);
	    while(!f.eof())
	    {
	      pos=f.tellg();
	      f.read((char*)&i,sizeof(i));
	      if(strcmpi(i.get_name(),n)==0)
	      {
		 cout<<"Enter by how much u want to increase: ";
		 cin>>q;
		 i.increase_q(q);
		 f.seekg(pos);
		 f.write((char*)&i,sizeof(i));
		 cout<<"Stock Updated!";
		 flag=1;
		 break;
	      }
	    }
	    if(flag==0)
	    {
	      cout<<"Item does not exist in stock!";
	    }
	    getch();
	    f.close();
	    break;
    case 5: clrscr();
	    main_head();
	    store_head();
	    cout<<"\n\n\n\n";
	    cout<<"Enter name: ";
	    gets(n);
	    ofstream f3("temp.dat",ios::binary);
	    while(f1.read((char*)&it,sizeof(it)))
	    {
	     if(strcmpi(n,it.get_name())!=0)
	     {
	       f3.write((char*)&it,sizeof(it));
	     }
	     else
	     {
	       it.outit();
	       cout<<"\nDo you really wish to delete?(y/n): ";
	       cin>>ans;
	       if(ans=='n')
		f3.write((char*)&it, sizeof(it));
	     }
	    }
	    cout<<"Item Deleted Successfully!";
	    getch();
	    f1.close();
	    f2.close();
	    f3.close();
	    remove("items.dat");
	    rename("temp.dat","Items.dat");
	    break;
    case 6: ex=1;
	    break;
    default: cout<<"Invalid Choice!";
	 }
    }
    while(ex!=1);
}

void login(int &flag)
  {
    Store st;
    ifstream f1("stores.dat",ios::binary);
    cout<<"       \t\t\t\tLOGIN";
    cout<<"\nUser Name: ";
    gets(user);
    cout<<"PIN: ";
    for(int i=0;i<4;i++)
    {
      p[i] = getch();
      cout<<"*";
    }
    p[4]='\0';
    while(f1.read((char*)&st,sizeof(st)))
    {
     if((strcmpi(user,st.get_uname())==0)&&(strcmpi(st.get_pin(),p)==0))
     { flag=1;
     }
    }
     f1.close();
  }

void signup()
{
  char st[30], ye[20], em[30], un[20], ph[11], pi[5];
  Store sto;
  cout<<"       \t\t\t\tSIGN UP";
  cout<<"\nEnter the details.";
  cout<<"\nStore's Name: ";
  gets(st);
  sto.set_store(st);
  cout<<"Year of Startup: ";
  gets(ye);
  sto.set_year(ye);
  cout<<"User Name: ";
  gets(un);
  sto.set_uname(un);
  cout<<"User Pin (4 digits long): ";
  for(int i=0;i<4;i++)
  {
    pi[i] = getch();
    cout<<"*";
  }
  pi[4]='\0';
  sto.set_pin(pi);
  cout<<"\nPhone Number: ";
  gets(ph);
  sto.set_phone(ph);
  cout<<"Email-id: ";
  gets(em);
  sto.set_email(em);
  ofstream f1("stores.dat",ios::binary|ios::app);
  f1.write((char*)&sto,sizeof(sto));
  cout<<"Sign Up Successful!!";
  f1.close();
  getch();
 }

void store_head()
{
  int i;
  ifstream f1("stores.dat",ios::binary);
  char stn[30];
  Store st;
  while(f1.read((char*)&st,sizeof(st)))
  {
    if((strcmpi(user,st.get_uname())==0)&&(strcmpi(st.get_pin(),p)==0))
    {
     strcpy(stn,st.get_store());
     cout<<"\n\t=================� ";
     for(i=0;stn[i]!='\0';i++)
     {
       cout<<stn[i];
     }
     cout<<" �=================";

    cout<<"\nCurrent Rates:";
    cout<<"\t\t\t\t\t\t\t";
    dt.out();
    cout<<"Gold: "<<cr.goldrate();
    cout<<"\nSilver: "<<cr.silverrate();
    }
  }
}

void main_head()
{
  cout<<"같같같같같같같같같같같같같 JEWELLERY SHOP MANAGEMENT 같같같같같같같같같같같같같�";
}

void home()
{
  salec s;
  customer cus;
  item it;
  char ch;
  int ex=0;
 do{
    clrscr();
    main_head();
    store_head();
 cout<<"\n\n\n\n";
 cout<<"\n1. Sale";
 cout<<"\n2. Customers";
 cout<<"\n3. Items";
 cout<<"\n4. Logout";
 cout<<"\nChoose your option.";
 ch=getch();
 switch(ch)
 {
   case '1' : clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      sale_menu(s);
	      break;
   case '2' : clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      cust_menu(cus);
	      break;
   case '3' : clrscr();
	      main_head();
	      store_head();
	      cout<<"\n\n\n\n";
	      item_menu(it);
	      break;
   case '4' : ex=1;
	      break;
   default: cout<<"Invalid Choice!";
 }
 }
 while(ex!=1);
}
void main()
{
  int ex=0;
  clrscr();
  Store st;
  char ch;
  int flag;
  float g,s;
  do{
  clrscr();
  main_head();
  cout<<"\n\n\n\n\n\n";
  cout<<"1. Sign Up.\n";
  cout<<"2. Login.\n";
  cout<<"3. Close App.\n";
  cout<<"Choose your option.\n";
  ch=getch();
  clrscr();
  main_head();
  switch(ch)
  {
    case '2': cout<<"\n\n\n\n\n\n";
	      login(flag);
	      if(flag==1)
	      {
		cout<<"\nLogin Successful. Welcome back!!";
		cout<<"\nPress any key to continue.";
		getch();
		clrscr();
		main_head();
		store_head();
		cout<<"\n\n\n\n";
		dt.in();
		cout<<"\nEnter Current Rate.";
		cout<<"\nGold: ";
		cin>>g;
		cr.set_grate(g);
		cout<<"Silver: ";
		cin>>s;
		cr.set_srate(s);
		home();
	      }
	      else
	      { cout<<"\nInvalid Username or PIN!";
		getch();
	      }
	      break;
    case '1': cout<<"\n\n\n\n\n\n";
	      signup();
	      break;
    case '3': ex=1;
	      break;
    default:  cout<<"Invalid Choice!";
  }
 }
 while(ex!=1);
  getch();
}










