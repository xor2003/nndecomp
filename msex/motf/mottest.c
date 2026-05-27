/* Program to verify if MotifSim will work on a given system */
#include "motfsm.h"
#include <graph.h>
#include <conio.h>
#include <string.h>
#include "mouse.h"

/* Window structure
 * struct WI wi
 * {
 *    x,y locations of corners of window
 *    int x1,y1,x2,y2;
 *    status of window - 0 = inactive, 1 = active restore, 2 = active max,
 *       3 = active min
 *    int stat;
 *    color of title bar
 *    int tc;
 *    order of window
 *    int ord;
 *    title name
 *    char title[50];
 *    menu bar - 0 = off, 1 = on
 *    int mb;
 *    menu names ( used if mb == 1 ), max is 10 menus
 *    char mu[10][10];
 *    click on menu
 *    int mc;
 *    main field color
 *    int mfc;
 * };
 */

main()
{
   struct WI w;
   int i;
   char k;

   i = init_gui();
   if( i < 0 )
   {
      _setvideomode(_DEFAULTMODE);
      printf("Initialization terminated with ");
      switch( i )
      {
	 case -4:
	    printf("video mode error\n");
	    printf("Possible remedies: video driver fault\n");
	    break;
	 case -5:
	    printf("font setting error\n");
	    printf("Program could not find the proper font file for use\n");
	    printf("Possible remedies: recopy ALL of the files on the ");
	    printf("MotifSim Test Disk\n");
	    break;
	 case -6:
	    printf("mouse error\n");
	    printf("Program couldn't initialize mouse\n");
	    printf("Possible remedies: reload mouse driver\n");
	    printf("Please note that MotifSim requires a MICROSOFT COMPATABLE ");
	    printf("mouse for operation.\n");
	    break;
	 default:
	    printf("font file error\n");
	    printf("Program could not find any font file for use\n");
	    printf("Possible remedies: recopy ALL of the files on the ");
	    printf("MotifSim Test Disk\n");
	    break;
      }
      printf("\n");

      printf("MotifSim will not be able to run on this system, as is.\n");
      printf("Make sure that you have placed all of the files for this\n");
      printf("program in the same directory.  If you have done this, \n");
      printf("look for support from the author of MotifSim\n");
      return( 0 );
   }

   w.x1 = 10, w.y1 = 10, w.x2 = 500, w.y2 = 200;
   w.stat = 1;
   w.tc = 7;
   w.typ = 1;
   w.mb = 0;
   strcpy( w.title, "mottest" );
   w.mfc = 7;

   drwin( w );

   _setcolor( 0 );
   _moveto( w.x1, w.y1 + 30 );
   _outgtext("MotifSim can run on this system.");
   _moveto( w.x1, w.y1 + 42 );
   _outgtext("You will now enter an interactive demo of MotifSim.");
   _moveto( w.x1, w.y1 + 54 );
   _outgtext("Close the demo's window or press any key to exit it.");

   btn( w.x1 + 10, w.y1 + 170, "OK", 0 );

   while( ( w.stat != 0 ) && ( w.stat != 3 ) && !kbhit() )
   {
      if( u_btn( w.x1 + 10, w.y1 + 170, "OK" ) )
	 break;
      i = msc( &w );
      if( i > -1 )
      {
	 w.x2 = w.x1 + 490, w.y2 = w.y1 + 190;
	 drwin( w );

	 _setcolor( 0 );
	 _moveto( w.x1, w.y1 + 30 );
	 _outgtext("MotifSim can run on this system.");
	 _moveto( w.x1, w.y1 + 42 );
	 _outgtext("You will now enter an interactive demo of MotifSim.");
	 _moveto( w.x1, w.y1 + 54 );
	 _outgtext("Close the demo's window or press any key to exit it.");

	 btn( w.x1 + 10, w.y1 + 170, "OK", 0 );
      }
   }

   _clearscreen(_GCLEARSCREEN);

   w.x1 = 10, w.y1 = 10, w.x2 = 500, w.y2 = 300;
   w.stat = 1;
   w.tc = 7;
   w.typ = 0;
   strcpy( w.title, "mottest" );
   w.mb = 1;
   for( i = 0; i < 10; i ++ )
      strcpy( w.mu[i], "" );
   strcpy( w.mu[0], "File" );
   strcpy( w.mu[1], "Edit" );
   w.mfc = 7;

   drwin( w );

   while( !kbhit() )
   {
      i = msc( &w );
      if( i >= 0 )
      {
	 _clearscreen(_GCLEARSCREEN);
	 if( ( w.stat == 3 ) || ( w.stat == 0 ) )
	    break;
	 drwin( w );
      }
   }

   end_gui();
}
