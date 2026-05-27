//Program File: WMDgame.cpp
#include<iostream.h>
#include<conio.h>
#include<iomanip.h>
#include<dos.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>
#include<fstream.h>
#include<string.h>
#include<assert.h>

//WMD: Weapons of Mass Domination, by Chris Horton
//Version 1.6
//(From a hard copy printed on August 8, 2006)

//World domination simulation game. Can you conquer the world?

//Functions********************************************************************

void Maingame(); //Runs the main game.
void Lastscore(); //For viewing the last score obtained.
void V_Control(); //Controls whether those annoying but fun beeps are on or not.
void Beep(); //Beep! Beep-beep! BEEEEEEEEEEEP! Bee-beep! Beep! (Makes a beep.
void ShowNuke(); //For showing the mushroom cloud.
void Multigame(); // Runs the multiplayer game.

//Global Variables & Constants*************************************************

int volume=0;
const int max_players=4;

//Main Program*****************************************************************

void main()
{
  int menuchoice=0;
  char x;
  do
  {
    //Title screen
    clrscr();
    textcolor(LIGHTRED);
    Beep();
    cprintf("WMD: Weapons of Mass Domination (Version BasicGame_1.6)\n\r");
    cout<<"By Chris Horton, programmed in C++.\n\nPress any key to start your conquest..."<<endl;
    ShowNuke();
    getch();
    clrscr();

    Beep();
    textcolor(YELLOW);//Main menu here.
    cprintf("Campaign Selector\n\r*******************\n\r");
    cout<<"1.) Lone Conquest"<<endl;
    cout<<"2.) Lone Conquest: Last Score"<<endl;
    cout<<"3.) (Empty Slot)"<<endl;
    cout<<"4.) Volume Control"<<endl;
    cout<<"5.) Exit"<<endl;
      cin>>menuchoice;
    
    //Process the user's choice and act on it.
    if(menuchoice==1)Maingame();//Starts the one-player main game.
    if(menuchoice==2)Lastscore();//Shows the last score achieved.
    if(menuchoice==3)Multigame();//Hopefully this will be a MULTIPLAYER option.
    if(menuchoice==4)V_Control();//Controls in-game beeps.
  }while(menuchoice!=5);

  Beep();
  cout<<"You leave for now...(Press any key to close this program.)"<<endl;

  getch();
}

//Functions********************************************************************

void Maingame()
{
  char playername[25];
  int money=500, weapons=1, land_area=1, day=0, year=0, influence=0, minions=10;
  int choice=0, score=0;
  int research=0, nuke=0;
  int enemy=0, e_army=500, e_defeat=0;
  ofstream lastscore; //For recording the last score achieved.

  randomize();
  srand(time(NULL));

  clrscr();

  //Get the player's name.
  Beep();
  cout<"Please enter your player name below (less than 25 characters):"<<endl;
    cin.ignore(25, '\n');
    cin.get(playername, 25);
  
  Beep();
  //Only one side available for now.
  cout<<"\nYour mission: conquer all 1000 sq. miles of the Earth's surface!"<<endl;
  cout<<"Press any key to begin world domination!"<<endl;
  getch();

  do
  {
    clrscr();
    day++;
    if(day==365)
    {
      year++;
      day=1;
    }
    //Status Display
    Beep();
    if(year>=1)cout<<"Year: "<<year<<" ";
    cout<<"Day "<<day<<":"<<endl;
    cout<<"\nYou currently have $"<<money<<", "<<(weapons*100)<<" weapons, and"<<endl;
    cout<<land_area<<" sq. miles in your possession.\n"<<endl;
    cout<<"You currently have "<<minions<<" minions under your control."<<endl;
    cout<<"You have "<<nuke<<" nukes, and "<<e_army<<" enemy soldiers to fight.\n"<<endl;

    // Menu of Choices
    textcolor(YELLOW);
    cprintf("Please choose your next strategy:\n\r");
    cout<<"1.) Rob banks (+200 money)"<<endl;
    cout<<"2.) Buy weaponry (+100 weapons, -150 money)"<<endl;
    cout<<"3.) Attack other countries (-200 money, land gain varies)"<<endl;
    cout<<"4.) Sell 5 land for $300"<<endl;
    cout<<"5.) Release new videotapes (+5 influence)"<<endl;
    cout<<"6.) Hire more minions (-50 money, minion gain based on influence)"<<endl;
    cout<<"7.) Research nuke tech (-400 money, +1 influence, +1 research)"<<endl;
    if(research==10)cout<<"8.) Build a nuke (-1500 money, +1 nuke)"<<endl;
    if(nuke>0)cout<<"9.) Launch a nuke (-1 nuke, cause mass destruction)"<<endl;
      cin>>choice;
    cout<<"\n";
    Beep();

    switch(choice)
    {
      case 1: {
               cout<<"You robbed $200. Spend wisely!"<<endl;
               money+=200;
              }
              break;
      case 2: {
               if(money>=150)
                 {
                 cout<<"You bought illegal weaponry for $150."<<endl;
                 weapons+=1;
                 money-=150;
                 }
               else cout<<"You don't have enough money. You wasted a day."<<endl;
              }
              break;
      case 3: {
               if(money>=200)
               {
                 cout<<"You went on a $200 campaign. You now control ";
                 land_area+=(pow(weapons, 2)+(land_area/1.5)+(minions/10));
                 if(land_area>1000)land_area=1000;
                 money-=200;
                 cout<<land_area<<" sq. miles."<<endl;
                 e_army=e_army-(minions/10);
                 if(e_army<=0){
                                e_defeat=1;
                                cout<<"Enemy defeated!"<<endl;
                                score=score+30;
                                }
                 else cout<<"Your enemy's army was reduced to "<<e_army<<" soldiers."<<endl;
               }
               else cout<<"You don't have enough money. You wasted a day."<<endl;
              }
              break;
      case 4: {
               if(land_area>=5)
               {
                 cout<<"You sold 5 sq. mi. of land for $300."<<endl;
                 land_area-=5;
                 money+=300;
               }
               else cout<<"You don't have enough land to sell. You wasted a day."<<endl;
              }
              break;
      case 5: {
               if(influence<100)
               {
                 cout<<"You sent out a videotape which proclaims your might and greatness."<<endl;
                 influence+=5;
                 cout<<"You now have "<<influence<<" influence points."<<endl;
                 score++;
               }
               else cout<<"You have 100 influence. People know you're great already!"<<endl;
              }
              break;
      case 6: {
               if(money>=50)
               {
                 cout<<"You seek out \"applicants\" for your \"job\"."<<endl;
                 if(influence>0)
                 {
                        minions=minions+(influence*10);
                        money-=50;
                        cout<<"You got "<<minions<<" minions now."<<endl;
                 }
                 else cout<<"Nobody paid attention to you, though. Too bad!"<<endl;
               }
               else cout<<"You don't have enough money to hire new minions. Rob stuff!"<<endl;
              }
              break;
      case 7: {
               if(money>=125)
               {
                 cout<<"You researched nuke tech."<<endl;
                 money=money-400;
                 influence++;
                 research++;
                 cout<<"You now have "<<research<<" out of 10 research points."<<endl;
                 if(research==1||research==2)cout<<"You read how a nuke works."<<endl;
                 if(research==3)cout<<"You've obtained the blueprints for a nuke."<<endl;
                 if(research==4)cout<<"You've reverse-engineered a nuke design."<<endl;
                 if(research==5||research==6)cout<<"Obtaining uranium..."<<endl;
                 if(research==7)cout<<"You've made enriched uranium!"<<endl;
                 if(research==8)cout<<"The nuke design is ready! Now for the silo..."<<endl;
                 if(research==9)cout<<"You designed the silo. Now for the last part..."<<endl;
                 if(research==10)cout<<"You made the nuke control program. Nuke ready for purchase."<<endl;
                 if(research>10){
                                 cout<<"Your nukes have been researched already."<<endl;
                                 money=money+500;
                                 influence--;
                                 research=10;
                                 }
               }
               else cout<<"You don't have enough money to fund your research!"<<endl;
              }
              break;
      case 8: {
               if(research==10)
               {
                 if(money>=1500)
                 {
                   textcolor(YELLOW);
                   cprintf("YOU BUILT A NUKE!!!\n\r");
                   influence=influence+20;
                   score=score+10;
                   nuke++;
                   money=money-1500;
                 }
                 else cout<<"You don't have enough money to build a nuke yet."<<endl;
               }
               else cout<<"You chose to do nothing."<<endl;
              }
              break;
      case 9: {
               if(nuke>0)
               {
                 textcolor(LIGHTRED);
                 cprintf("FIRING NUKE!\n\r");
                 cout<<"There it goes."<<endl;
                 nuke--;
                 sleep(1);
                 cout<<".";
                 sleep(1);
                 cout<<"."<<endl;
                 sleep(1);
                 cprintf("\nIT'S A HIT!!!!!\n\r");
                 sleep(1);
                 clrscr();
                 ShowNuke();
                 Sleep(2);
                 clrscr();
                 cout<<"The nuke struck the enemy! You gained 300 land and"<<endl;
                 cout<<"killed 400 enemy soldiers."<<endl;
                 land_area=land_area+300;
                 if(land_area>1000)land_area=1000;
                 e_army=e_army-400;
                 if(e_army<0){
                             e_army=0;
                             e_defeat=1;
                             cout<<"You've annihilated the enemy!"<<endl;
                             }
                 score=score+5;
               }
               else cout<<"You did nothing and wasted a day."<<endl;
              } break;
      default: cout<<"You chose to do nothing."<<endl;
    }

    if(e_defeat!=1)
    {
    cout<<"\nYour enemies take action."<<endl;
    enemy=rand()%7+1;

    if(enemy==1){
                  cout<<"They take back some of your cash. (-$100)"<<endl;
                  money-=100;
                  if(money<0)money=0;
                }
    if(enemy==2){
                  cout<<"They destroy some of your weapons. (-100 weapons)"<<endl;
                  weapons-=1;
                  if(weapons<0)weapons=0;
                }
    if(enemy==3){
                  cout<<"They attack you back! (-"<<(e_army/15)<<" land, -"<<(e_army/15)<<" minions"<<endl;
                  land_area=land_area-(e_army/15);
                  minions=minions-(e_army/15);
                  e_army=e_army-(minions/10);
                  if(land_area<1)land_area=1;
                  if(minions<0)minions=0;
                  if(e_army<=0){
                                e_army=0;
                                e_defeat=1;
                                cout<<"Enemy defeated!"<<endl;
                               }
                }
    if(enemy==4){
                  cout<<"They fall asleep! Zzzzz..."<<endl;
                }
    if(enemy==5){
                  cout<<"They are discussing something."<<endl;
                }
    if(enemy==6){
                  cout<<"They denounce you and declare you will be destroyed at all costs. (-10 influence)."<<endl;
                  influence-=10;
                  if(influence<0)influence=0;
                }
    if(enemy==7){
                  cout<<"Your enemies recruit some soldiers. They have ";
                  e_army=e_army+(100-influence);
                  cout<<e_army<<" soldiers now."<<endl;
                }
    }
    else cout<<"There are no enemies in sight!"<<endl;

    cout<<"Press any key to continue.";

    getch();
  }while(land_area<1000);

  Beep();
  textcolor(LIGHTGREEN);
  cout<<"\n"<<endl;
  cprintf("Congratulations! The world is now yours!\n\r");
  cout<<"Would you like to save your score?"<<endl;
  cout<<"1.) Yes"<<endl; cout<<"2.) No"<<endl;
    cin>>choice;
  
  /*As this program is looking for the h:/ drive, which is the Student Folder at
  the MST, you will not be able to save at home yet. I hope to include an option
  I read about where you can type in the directory where to save game files at...
  Probably in the folder where the game was installed.*/

  if(choice==1)
  {
    cout<<"\nPlease select a save location:\n1.) h:\\WMDlastscore.cpp (for school users)";
    cout<<"\n2.) c:\\WMDlastscore.cpp (for home users)"<<endl;
      cin>>choice;
    if(choice==1)lastscore.open("h:\\WMDlastscore.cpp");
    if(choice==2)lastscore.open("c:\\WMDlastscore.cpp");//May not work.
    if(choice!=1&&choice!=2)
    {
      cout<<"Choice not understood. Defaulting to option 2."<<endl;
      lastscore.open("c:\\WMDlastscore.cpp");
    }
    lastscore<<playername<<endl<<day<<endl;
      score=score+((2*weapons)+(money/10)+(nuke*10)+(influence*10)+(e_defeat*50)-(day/2)-e_army);
    lastscore<<score<<endl;
    lastscore.close();

    Beep();
    cout<<"\nYour last score is now available for viewing from the main menu."<<endl;
    sleep(1);
  }
  else score=score+((2*weapons)+(money/10)+(nuke*10)+(influence*10)+(e_defeat*50)-(day/2)-e_army);
  cout<<"(Your score this game was "<<score<<" points.)"<<endl;
  cout<<"\nPress any key to return to the title screen."<<endl;

  getch();
}

void V_Control()
{
    int choice=0;
    clrscr();
    textcolor(YELLOW);
    Beep();
    cprintf("Volume Control\n\r");
    cout<<"\nPlease select whether you want in-game beeps on or off."<<endl;
    cout<<"1.) On"<<endl;
    cout<<"2.) Off"<<endl;
      cin>>choice;
    
    if(choice==1){volume=1;
                  cout<<"\nIn-game beeps are now on."<<endl;
                  }
    else if(choice==2){volume=0;
                       cout<<"\nIn-game beeps are now off."<<endl;
                       }
    else cout<<"Your choice was not understood. The settings are unchanged."<<endl;
    Beep();

    //This may soon include the ability to save the volume settings to the game folder.

    cout<<"\nPress any key to return to the title screen."<<endl;
    getch();
}

void Beep()
{
  if(volume==1)cout<<"\a";
}

void Lastscore()
{
  char temp1[25];
  int temp2, temp3, load_opt;
  clrscr();
  textcolor(LIGHTGREEN);
  Beep();
  cout<<"Enter the number of the choice where you score is saved."<<endl;
  cout<<"1.) h:\\WMDlastscore.cpp"<<endl;
  cout<<"2.) c:\\WMDlastscore.cpp"<<endl;//May not work.
    cin>>load_opt;
  clrscr();
  cprintf("LAST SCORE ACHIEVED\n\r**********************\n\r");
  cout<<"Name: ";
  ifstream Lscoreget;
  if(load_opt==1)Lscoreget.open("h:\\WMDlastscore.cpp");
  if(load_opt==2)Lscoreget.open("c:\\WMDlastscore.cpp");
  if(load_opt==1||load_opt==2)
  {
    Lscoreget>>temp1>>temp2>>temp3;
    Lscoreget.close();
    cout<<temp1<<endl;
    cout<<"Days needed: "<<temp2<<endl;
    cout<<"Score: "<<temp3<<endl;
    cout<<"\nPress any key to return to the title screen."<<endl;
    getch();
  }
  else cout<<"Invalid option. Press any key to return to the title screen."<<endl;
}

void ShowNuke()//Until real graphics are developed, this will have to do.
{
  cout<<"                            0000000000                          "<<endl;
  cout<<"     00                00000000000000000000                     "<<endl;
  cout<<"      00             000000000000000000000000                   "<<endl;
  cout<<"                   0000000000000000000000000000                 "<<endl;
  cout<<"                  000000000000000000000000000000      00000     "<<endl;
  cout<<"                 00000000000000000000000000000000      000      "<<endl;
  cout<<"                 00000000000000000000000000000000               "<<endl;
  cout<<"                  000000000000000000000000000000                "<<endl;
  cout<<"                    00000000000000000000000000                  "<<endl;
  cout<<"                        000000000000000000                      "<<endl;
  cout<<"                            0000000000                          "<<endl;
  cout<<"                             00000000                           "<<endl;
  cout<<"                              000000                            "<<endl;
  cout<<"                        000000000000000000                      "<<endl;
  cout<<"                       0      000000      0                     "<<endl;
  cout<<"                        000000000000000000                      "<<endl;
  cout<<"                              000000                            "<<endl;
  cout<<"                         \\   00000000   /                       "<<endl;
  cout<<"                         _ 000000000000 _                       "<<endl;
  cout<<"0 0 0 0 0 0 0 0 0 0 0 0 0 00000000000000 0 0 0 0 0 0 0 0 0 0 0 0"<<endl;
  cout<<"0000000000000000000000000000000000000000000000000000000000000000"<<endl;
}

//The code for the multiplayer game follows:***********************************

void Multigame()
{
  char playername[max_players][25];
  int money=500, weapons=1, land_area=1, day=0, year=0, influence=0, minions=10, choice=0, score=0;
  int research=0, nuke=0;
  int enemy=0, e_army=500, e_defeat=0;
  //Last score achieved will not be recorded in multiplayer.
  int playernum;

  randomize();
  srand(time(NULL));

  clrscr();

  //In multiplayer, we first want to know how many players there are.
  Beep();
  cout<<"To play multiplayer, the number of players is required."<<endl;
  cout<<"How many players will there be in the game? (Up to 4.)"<<endl;
    cin>>playernum;
  
  if(playernum>max_players)
  {
    cout<<"\nYou entered more players than you are allowed to. Reset to ";
    cout<<max_players<<" players."<<endl;
    playernum=max_players;
    sleep(1);
  }

  if(playernum<=1)
  {
    cout<<"\nToo few players entered. Reset to 2 players."<<endl;
    playernum=2;
    sleep(1);
  }

  for(int x=0; x<playernum; ++x)
  {
  // Get the player's name.
  Beep();
  cout<<"Please enter player "<<(x+1)<<"'s name below (less than 25 characters):"<<endl;
    cin.ignore(25, '\n');
    cin.get(playername[x], 25);
  }
  
  Beep();
  //Only one side available for now.
  cout<<"Players! Prepare for your conquest."<<endl;
  cout<<"\nYour mission: conquer all 1000 sq. miles of the Earth's surface!"<<endl;
  cout<<"Press any key to begin world domination!"<<endl;
  getch();

  do
  {
    clrscr();
    day++;
    //Status Display
    Beep();
    cout<<"Day "<<day<<":"<<endl;
    cout<<"\nYou currently have $"<<money<<", "<<(weapons*100)<<" weapons, and"<<endl;
    cout<<land_area<<" sq. miles in your possession.\n"<<endl;
    cout<<"You currently have "<<minions<<" minions under your control."<<endl;
    cout<<"You have "<<nuke<<" nukes, and "<<e_army<<" enemy soldiers to fight.\n"<<endl;

    // Menu of Choices
    textcolor(YELLOW);
    cprintf("Please choose your next strategy:\n\r");
    cout<<"1.) Rob banks (+200 money)"<<endl;
    cout<<"2.) Buy weaponry (+100 weapons, -150 money)"<<endl;
    cout<<"3.) Attack other countries (-200 money, land gain varies)"<<endl;
    cout<<"4.) Sell 5 land for $300"<<endl;
    cout<<"5.) Release new videotapes (+5 influence)"<<endl;
    cout<<"6.) Hire more minions (-50 money, minion gain based on influence)"<<endl;
    cout<<"7.) Research nuke tech (-400 money, +1 influence, +1 research)"<<endl;
    if(research==10)cout<<"8.) Build a nuke (-1500 money, +1 nuke)"<<endl;
    if(nuke>0)cout<<"9.) Launch a nuke (-1 nuke, cause mass destruction)"<<endl;
      cin>>choice;
    cout<<"\n";
    Beep();

    switch(choice)
    {
      case 1: {
               cout<<"You robbed $200. Spend wisely!"<<endl;
               money+=200;
              }
              break;
      case 2: {
               if(money>=150)
                 {
                 cout<<"You bought illegal weaponry for $150."<<endl;
                 weapons+=1;
                 money-=150;
                 }
               else cout<<"You don't have enough money. You wasted a day."<<endl;
              }
              break;
      case 3: {
               if(money>=200)
               {
                 cout<<"You went on a $200 campaign. You now control ";
                 land_area+=(pow(weapons, 2)+(land_area/1.5)+(minions/10));
                 if(land_area>1000)land_area=1000;
                 money-=200;
                 cout<<land_area<<" sq. miles."<<endl;
                 e_army=e_army-(minions/10);
                 if(e_army<=0){
                                e_defeat=1;
                                cout<<"Enemy defeated!"<<endl;
                                score=score+30;
                                }
                 else cout<<"Your enemy's army was reduced to "<<e_army<<" soldiers."<<endl;
               }
               else cout<<"You don't have enough money. You wasted a day."<<endl;
              }
              break;
      case 4: {
               if(land_area>=5)
               {
                 cout<<"You sold 5 sq. mi. of land for $300."<<endl;
                 land_area-=5;
                 money+=300;
               }
               else cout<<"You don't have enough land to sell. You wasted a day."<<endl;
              }
              break;
      case 5: {
               if(influence<100)
               {
                 cout<<"You sent out a videotape which proclaims your might and greatness."<<endl;
                 influence+=5;
                 cout<<"You now have "<<influence<<" influence points."<<endl;
                 score++;
               }
               else cout<<"You have 100 influence. People know you're great already!"<<endl;
              }
              break;
      case 6: {
               if(money>=50)
               {
                 cout<<"You seek out \"applicants\" for your \"job\"."<<endl;
                 if(influence>0)
                 {
                        minions=minions+(influence*10);
                        money-=50;
                        cout<<"You got "<<minions<<" minions now."<<endl;
                 }
                 else cout<<"Nobody paid attention to you, though. Too bad!"<<endl;
               }
               else cout<<"You don't have enough money to hire new minions. Rob stuff!"<<endl;
              }
              break;
      case 7: {
               if(money>=125)
               {
                 cout<<"You researched nuke tech."<<endl;
                 money=money-400;
                 influence++;
                 research++;
                 cout<<"You now have "<<research<<" out of 10 research points."<<endl;
                 if(research==1||research==2)cout<<"You read how a nuke works."<<endl;
                 if(research==3)cout<<"You've obtained the blueprints for a nuke."<<endl;
                 if(research==4)cout<<"You've reverse-engineered a nuke design."<<endl;
                 if(research==5||research==6)cout<<"Obtaining uranium..."<<endl;
                 if(research==7)cout<<"You've made enriched uranium!"<<endl;
                 if(research==8)cout<<"The nuke design is ready! Now for the silo..."<<endl;
                 if(research==9)cout<<"You designed the silo. Now for the last part..."<<endl;
                 if(research==10)cout<<"You made the nuke control program. Nuke ready for purchase."<<endl;
                 if(research>10){
                                 cout<<"Your nukes have been researched already."<<endl;
                                 money=money+500;
                                 influence--;
                                 research=10;
                                 }
               }
               else cout<<"You don't have enough money to fund your research!"<<endl;
              }
              break;
      case 8: {
               if(research==10)
               {
                 if(money>=1500)
                 {
                   textcolor(YELLOW);
                   cprintf("YOU BUILT A NUKE!!!\n\r");
                   influence=influence+20;
                   score=score+10;
                   nuke++;
                   money=money-1500;
                 }
                 else cout<<"You don't have enough money to build a nuke yet."<<endl;
               }
               else cout<<"You chose to do nothing."<<endl;
              }
              break;
      case 9: {
               if(nuke>0)
               {
                 textcolor(LIGHTRED);
                 cprintf("FIRING NUKE!\n\r");
                 cout<<"There it goes."<<endl;
                 nuke--;
                 sleep(1);
                 cout<<".";
                 sleep(1);
                 cout<<"."<<endl;
                 sleep(1);
                 cprintf("\nIT'S A HIT!!!!!\n\r");
                 sleep(1);
                 clrscr();
                 ShowNuke();
                 Sleep(2);
                 clrscr();
                 cout<<"The nuke struck the enemy! You gained 300 land and"<<endl;
                 cout<<"killed 400 enemy soldiers."<<endl;
                 land_area=land_area+300;
                 if(land_area>1000)land_area=1000;
                 e_army=e_army-400;
                 if(e_army<0){
                             e_army=0;
                             e_defeat=1;
                             cout<<"You've annihilated the enemy!"<<endl;
                             }
                 score=score+5;
               }
               else cout<<"You did nothing and wasted a day."<<endl;
              } break;
      default: cout<<"You chose to do nothing."<<endl;
    }

    if(e_defeat!=1)
    {
    cout<<"\nYour enemies take action."<<endl;
    enemy=rand()%7+1;

    if(enemy==1){
                  cout<<"They take back some of your cash. (-$100)"<<endl;
                  money-=100;
                  if(money<0)money=0;
                }
    if(enemy==2){
                  cout<<"They destroy some of your weapons. (-100 weapons)"<<endl;
                  weapons-=1;
                  if(weapons<0)weapons=0;
                }
    if(enemy==3){
                  cout<<"They attack you back! (-"<<(e_army/15)<<" land, -"<<(e_army/15)<<" minions"<<endl;
                  land_area=land_area-(e_army/15);
                  minions=minions-(e_army/15);
                  e_army=e_army-(minions/10);
                  if(land_area<1)land_area=1;
                  if(minions<0)minions=0;
                  if(e_army<=0){
                                e_army=0;
                                e_defeat=1;
                                cout<<"Enemy defeated!"<<endl;
                               }
                }
    if(enemy==4){
                  cout<<"They fall asleep! Zzzzz..."<<endl;
                }
    if(enemy==5){
                  cout<<"They are discussing something."<<endl;
                }
    if(enemy==6){
                  cout<<"They denounce you and declare you will be destroyed at all costs. (-10 influence)."<<endl;
                  influence-=10;
                  if(influence<0)influence=0;
                }
    if(enemy==7){
                  cout<<"Your enemies recruit some soldiers. They have ";
                  e_army=e_army+(100-influence);
                  cout<<e_army<<" soldiers now."<<endl;
                }
    }
    else cout<<"There are no enemies in sight!"<<endl;

    cout<<"Press any key to continue.";

    getch();
  }while(land_area<1000);

  Beep();
  textcolor(LIGHTGREEN);
  cout<<"\n"<<endl;
  cprintf("Congratulations! The world is now yours!\n\r");
  
  cout<<"\nPress any key to return to the main menu..."<<endl;
  getch();
}

//The count for how many lines this program is will be included here.
//This is not displayed on my home compiler of Borland. There are
//753 lines of code.