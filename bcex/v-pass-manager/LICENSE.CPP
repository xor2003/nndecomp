//---------------------------------------------------------------------------
//--------------------------LICENSE AGREEMENT FILE---------------------------
//---------------------------------------------------------------------------

//generate title of license agreement
void lic(void)
{
	_setcursortype(_NOCURSOR);
	textbackground(WHITE);
	textcolor(BLACK);
	gotoxy(25, 1);
	line(28, 0, (char)196);
	gotoxy(25, 4);
	line(28, 0, (char)196);
	textcolor(RED);
	gotoxy(35, 2);
	cprintf("END USER");
	gotoxy(30, 3);
	cprintf("LICENSE AGREEMENT");
}

//function of license agreement
int license(int n = 0)
{
	if (!n || n)
	{
		clrscr();

	page1:
		if (choice == (char)27)
			clrscr();
		lic();
		textcolor(BLUE);
		gotoxy(5, 6);
		cprintf("This License Agreement (the \"AGREEMENT\") is a legal agreement between");
		gotoxy(5, 7);
		cprintf("you individually, or if you are authorized to acquire the Software on");
		gotoxy(5, 8);
		cprintf("behalf of your company or another organization , between the entities");
		gotoxy(5, 9);
		cprintf("for whose benefit you act.");

		gotoxy(5, 11);
		cprintf("BY INDICATING YOUR ACCEPTANCE BY CLICKING ON THE APPROPRIATE BUTTON ,");
		gotoxy(5, 12);
		cprintf("OR BY INSTALLING, ACTIVATING OR USING THE SOFTWARE , YOU ARE AGREEING");
		gotoxy(5, 13);
		cprintf("TO BE BOUND BY THE TERMS OF THIS AGREEMENT.");
		gotoxy(5, 14);
		cprintf("IF YOU HAVE ANY QUESTION OR CONCERNS ABOUT THE TERMS OF THE AGREEMENT");
		gotoxy(5, 15);
		cprintf("PLEASE CONTACT US AT - ");

		textcolor(BLACK);
		gotoxy(5, 16);
		cprintf("vivekpatel111@yahoo.co.in");

		textcolor(BLUE);
		gotoxy(5, 18);
		cprintf("IF, PRIOR TO ACTIVATING OR USING THE SOFTWARE, YOU DECIDE YOU ARE NOT");
		gotoxy(5, 19);
		cprintf("WILLING TO AGREE TO THE TERMS OF THIS AGREEMENT, YOU HAVE NO RIGHT TO"); //
		gotoxy(5, 20);
		cprintf("USE THE SOFTWARE AND SHOULD RETURN IT, DELETE OR DISABLE IT.");

		gotoxy(25, 22);
		textcolor(BLACK + BLINK);
		cprintf("Press any key to continue...");
		choice = getch();

		if (choice == (char)27)
			return 1;

	page2:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(5, 6);
		cprintf("1. GRANT OF LICENSE");
		textcolor(BLUE);
		gotoxy(5, 8);
		cprintf("Subject to the terms below, This software hereby grants You a personal");
		gotoxy(5, 9);
		cprintf(",revocable, non-exclusive, non-transferable license to install and use");
		gotoxy(5, 10);
		cprintf("a copy of the Software on only one computer.  You may not rent, lease,");
		gotoxy(5, 11);
		cprintf("lend, sell, redistribute or sublicense the Software.  You may not copy");
		gotoxy(5, 12);
		cprintf("( other than 1 back-up copy for archival purposes only ) , decompile ,");
		gotoxy(5, 13);
		cprintf("reverse engineer , disassemble , attempt to derive the source code of,");
		gotoxy(5, 14);
		cprintf("modify , or create derivative works of the Software , any updates , or");
		gotoxy(5, 15);
		cprintf("any things there of  (  except as and only to the extent any foregoing");
		gotoxy(5, 16);
		cprintf("restriction is prohibited by applicable law or to the extent as may be");
		gotoxy(5, 17);
		cprintf("permitted by the licensing terms and governing use of any open sourced");
		gotoxy(5, 18);
		cprintf("components, if any, included with the Software). This license does not");
		gotoxy(5, 19);
		cprintf("imply any rights to future upgrades or updates of the Software.");

		gotoxy(25, 22);
		textcolor(BLACK + BLINK);
		cprintf("Press any key to continue...");
		choice = getch();
		if (choice == (char)27)
			goto page1;

	page3:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(5, 6);
		cprintf("2. INTELLECTUAL PROPERTY");
		textcolor(BLUE);
		gotoxy(5, 8);
		cprintf("You  do not acquire  any  intellectual property  or  other proprietary");
		gotoxy(5, 9);
		cprintf("rights, including patents, designs, trademarks, copyright or rights in");
		gotoxy(5, 10);
		cprintf("any  confidential  information   or secrets ,  in  or relating to  the");
		gotoxy(5, 11);
		cprintf("Software.");

		textcolor(BLACK);
		gotoxy(5, 14);
		cprintf("3. DATA STORAGE");
		textcolor(BLUE);
		gotoxy(5, 16);
		cprintf("This Software assumes  no  responsibility  or liability whatsoever for");
		gotoxy(5, 17);
		cprintf("the deletion or failure to store your data or information.");

		gotoxy(25, 22);
		textcolor(BLACK + BLINK);
		cprintf("Press any key to continue...");
		choice = getch();
		if (choice == (char)27)
			goto page2;

	page4:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(5, 6);
		cprintf("4. NO WARRANTY");
		textcolor(BLUE);
		gotoxy(5, 8);
		cprintf("YOU EXPRESSLY ACKNOWLEDGE AND AGREE  THAT YOUR USE OF THE SOFTWARE AND");
		gotoxy(5, 10);
		cprintf("RELATED SERVICES ARE AT YOUR SOLE RISK AND THAT THE ENTIRE RISKS AS TO");
		gotoxy(5, 12);
		cprintf("SATISFACTORY QUALITY, PERFORMANCE, ACCURACY AND EFFORT IS WITH YOU. TO");
		gotoxy(5, 14);
		cprintf("THE MAXIMUM EXTENT PERMITTED BY  APPLICABLE LAW , THE SOFTWARE AND ANY");
		gotoxy(5, 16);
		cprintf("RELATED SERVICES  ARE  PROVIDED \"AS IS\" AND \"AS AVAILABLE\" ,  WITH ALL");
		gotoxy(5, 18);
		cprintf("FAULTS AND  WITHOUT WARRANTY OF ANY KIND , AND  I HEREBY DISCLAIMS ALL");
		gotoxy(5, 20);
		cprintf("WARRANTIES  AND  CONDITIONS WITH RESPECT  TO  THE SOFTWARE AND RELATED");
		gotoxy(5, 22);
		cprintf("SERVICES.");

		gotoxy(25, 22);
		textcolor(BLACK + BLINK);
		cprintf("Press any key to continue...");
		choice = getch();
		if (choice == (char)27)
			goto page3;

	page5:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(5, 6);
		cprintf("5. CONSENT TO USE OF DATA");
		textcolor(BLUE);
		gotoxy(5, 8);
		cprintf("You agree that  this software may collect and  use technical data  and");
		gotoxy(5, 9);
		cprintf("related information,including but not limited to technical information");
		gotoxy(5, 10);
		cprintf("about Your Computer, system and application software.");

		textcolor(BLACK);
		gotoxy(5, 14);
		cprintf("6. TERMINATION");
		textcolor(BLUE);
		gotoxy(5, 16);
		cprintf("This Agreement shall terminate automatically without notice from us if");
		gotoxy(5, 17);
		cprintf("you fail to comply with any of the terms of this Agreement , the Terms");
		gotoxy(5, 18);
		cprintf("of Service, or Your subscription. Upon termination of the license, you");
		gotoxy(5, 19);
		cprintf("shall cease all use of the Software and related services , and destroy");
		gotoxy(5, 20);
		cprintf("all copies, full or partial, of the Software.");

		gotoxy(25, 22);
		textcolor(BLACK + BLINK);
		cprintf("Press any key to continue...");
		choice = getch();
		if (choice == (char)27)
			goto page4;

	page6:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(5, 6);
		cprintf("7. REDISTRIBUTED CODE");
		textcolor(BLUE);
		gotoxy(5, 8);
		cprintf("The  Software  may  contain  binary  representations  of  third  party");
		gotoxy(5, 9);
		cprintf("components  which  may be  open  source libraries . Unless required by");
		gotoxy(5, 10);
		cprintf("applicable law , redistributed software in this Section is distributed");
		gotoxy(5, 11);
		cprintf("\"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, AND WITHOUT");
		gotoxy(5, 12);
		cprintf("ANY LIABILITY OF ANY KIND WHATSOEVER TO EMTRACE.Text file accompanying");
		gotoxy(5, 13);
		cprintf("the Software will specify  type of redistributed code included  in the");
		gotoxy(5, 14);
		cprintf("Software , together with the applicable  redistributed code license or");
		gotoxy(5, 15);
		cprintf("reference thereto.");

		gotoxy(23, 22);
		textcolor(BLACK + BLINK);
		if (n)
			cprintf("  Press any key to continue...");
		else
			cprintf("Press any key to go into HELP...");
		choice = getch();
		if (choice == (char)27)
			goto page5;

		if (n)
			goto last;
		else
			return 1;
	}
	else
	{
	last:
		clrscr();
		lic();
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(10, 8);
		cprintf("By clicking \"ACCEPT\" below , you electronically agree to our");
		gotoxy(10, 10);
		cprintf("Terms of Services and Privacy Policy ( the \" Terms \" ) ; you");
		gotoxy(10, 12);
		cprintf("acknowledge receipts  of our Terms , and you agree to adopt");
		gotoxy(10, 14);
		cprintf("whotoever written in the Terms of Service.");

		gotoxy(30, 17);
		textcolor(RED);
		cprintf("A");
		textcolor(BLUE);
		cprintf("CCEPT");

		gotoxy(40, 17);
		textcolor(RED);
		cprintf("D");
		textcolor(BLUE);
		cprintf("ECLINE");

		textcolor(BLACK);
		gotoxy(27, 22);
		cprintf("... Press Character ...");
		choice = getch();
		if (choice == (char)27)
			goto page6;

		else if (choice == 'A' || choice == 'a')
		{
			gotoxy(30, 17);
			textcolor(RED + BLINK);
			cprintf("A");
			textcolor(BLUE + BLINK);
			cprintf("CCEPT");
			delay(500);
			return 1;
		}

		else if (choice == 'D' || choice == 'd')
		{
			gotoxy(40, 17);
			textcolor(RED + BLINK);
			cprintf("D");
			textcolor(BLUE + BLINK);
			cprintf("ECLINE");
			delay(500);
			clrscr();
			gotoxy(15, 7);
			textcolor(RED);
			cprintf("YOU DON'T HAVE ANY PRIVILEGE TO USE THIS SOFTWARE.");
			gotoxy(11, 10);
			cprintf("YOU MUST ACCEPT \"TERMS & CONDITIONS\" TO USE THIS SOFTWARE.");
			gotoxy(14, 13);
			cprintf("KINDLY RESTART THE  APPLICATION TO USE THE SOFTWARE.");
			gotoxy(16, 16);
			cprintf("OR DELETE THE SOFTWARE IF YOU DON'T WANT TO USE.");

			gotoxy(27, 22);
			textcolor(BLACK + BLINK);
			cprintf("Press any key to exit...");

			getch();
			return 2;
		}

		else
		{
			textcolor(BLACK + BLINK);
			gotoxy(21, 23);
			cprintf("Please Select valid choice character.");
			getch();
			gotoxy(21, 23);
			cprintf("                                     ");
			goto last;
		}
	}
}
