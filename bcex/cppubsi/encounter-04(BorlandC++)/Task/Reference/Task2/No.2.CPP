#include <stdio.h>
#include <conio.h>
#include <iostream.h>

garis()
{
cout<<"===========================================";
}
             
judul()
{
cout<<"\t\tTIKET KERETA\t";
}

main()
{

struct
{ char kode[3], kelas, nama_orang[20], nama_kereta[15], nama_kelas[20];
  int jumbel, harga;
  long bayar, diskon, pembayaran, tot_bay, uang_kem;
}tiket;
char lagi;

atas:
clrscr();

garis();
cout<<""<<endl;
judul();
cout<<""<<endl;
garis();
cout<<""<<endl;

cout<<"Kode kereta[AG/AL/PH]\t\t: ";cin>>tiket.kode;
cout<<"Kelas kereta[1/2/3]\t\t: ";cin>>tiket.kelas;
cout<<"Nama pemesan\t\t\t: ";cin>>tiket.nama_orang;

garis();
cout<<""<<endl;
judul();
cout<<""<<endl;
garis();
cout<<""<<endl;

if (strcmpi(tiket.kode, "AG")==0)
{
strcpy(tiket.nama_kereta, "Argo Bromo");
    if     (tiket.kelas=='1')
    {
    strcpy(tiket.nama_kelas, "Executive");
    tiket.harga=800000;
    }
    else if(tiket.kelas=='2')
    {
    strcpy(tiket.nama_kelas, "Bisnis");
    tiket.harga=500000;
    }
    else if(tiket.kelas=='3')
    {
    strcpy(tiket.nama_kelas, "Ekonomi");
    tiket.harga=250000;
    }
    else
    {strcpy(tiket.nama_kelas, "salah kode");

    }}
if (strcmpi(tiket.kode, "AL")==0)
{
strcpy(tiket.nama_kereta, "Argo lawu");
    if     (tiket.kelas=='1')
    {strcpy(tiket.nama_kelas, "Executive");
    tiket.harga=700000;}
    else if(tiket.kelas=='2')
    {strcpy(tiket.nama_kelas, "Bisnis");
    tiket.harga=400000;}
    else if(tiket.kelas=='3')
    {strcpy(tiket.nama_kelas, "Ekonomi");
    tiket.harga=200000;}
    else
    {strcpy(tiket.nama_kelas, "salah kode");

    }}
if (strcmpi(tiket.kode, "PH")==0)
{
strcpy(tiket.nama_kereta, "Parahyangan");
    if     (tiket.kelas=='1')
    {strcpy(tiket.nama_kelas, "Executive");
    tiket.harga=600000;}
    else if(tiket.kelas=='2')
    {strcpy(tiket.nama_kelas, "Bisnis");
    tiket.harga=350000;}
    else if(tiket.kelas=='3')
    {strcpy(tiket.nama_kelas, "Ekonomi");
    tiket.harga=175000;}
    else
    {strcpy(tiket.nama_kelas, "salah kode");

    }

}
cout<<"Nama Pemesan   :"<<tiket.nama_orang<<endl;
cout<<"Nama Kereta   :"<<tiket.nama_kereta<<endl;
cout<<"Kelas kereta   :"<<tiket.kelas<<endl;
cout<<"Nama kelas\t\t\t:"<<tiket.nama_kelas<<endl;
cout<<"Harga pertiket\t  :"<<tiket.harga<<endl;
cout<<"Jumlah pemesanan\t  :";cin>>tiket.jumbel;

tiket.bayar=tiket.jumbel*tiket.harga;



if (tiket.jumbel>=10)
{tiket.diskon=tiket.bayar*0.25;}

else if (tiket.jumbel>5)
{tiket.diskon=tiket.bayar*0.1;}

else
{tiket.diskon=tiket.bayar*0;}


cout<<"Pembayaran    :"<<tiket.bayar<<endl;
cout<<"diskon\t\t\t\t:"<<tiket.diskon<<endl;

garis();
cout<<""<<endl;

tiket.tot_bay=tiket.bayar-tiket.diskon;
cout<<"Total pembayaran  :"<<tiket.tot_bay<<endl;
cout<<"Uang Pembayaran\t\t\t:";cin>>tiket.pembayaran;

tiket.uang_kem=tiket.pembayaran-tiket.tot_bay;

cout<<"uang kembali    :"<<tiket.uang_kem<<endl;

cout<<""<<endl;
cout<<""<<endl;
cout<<"ingin pilih lagi[y/t]        =";cin>>lagi;
if(lagi=='y' || lagi=='Y')
goto atas;
getch();
}

