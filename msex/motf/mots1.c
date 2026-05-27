/* Motif showing simulation */
#include <graph.h>
#include <string.h>
#include "motfsm.h"
#include "mouse.h"

main()
{
   struct WI w;
   char str[3][50], st[10];
   int i;

   init_gui();

   _setcolor( 7 );
   _floodfill( 50,50,7 );
   PushButton( 50, 100, "One", 0, 1, 0 );
   PushButton( 175, 100, "One", 1, 1, 0 );
   PushButton( 300, 100, "Two", 0, 0, 0 );
   PushButton( 425, 100, "Two", 1, 0, 0 );

   getch();

   _clearscreen( _GCLEARSCREEN );
   _setcolor( 7 );
   _floodfill( 50,50,7 );

   OptionButton( 50, 100, "Three", 0, 0 );
   OptionButton( 175, 100, "Three", 1, 0 );

   getch();

   _clearscreen( _GCLEARSCREEN );

   strcpy( str[0], "One" );
   strcpy( str[1], "Two" );
   strcpy( str[2], "Three" );

   str[0][49] = 1;
   str[1][49] = 1;
   str[2][49] = 0;
   str[0][48] = 0;
   str[1][48] = 0;
   str[2][48] = 1;

   PulldownMenu( 175, 100, str, 3, 1 );

   getch();

   _clearscreen( _GCLEARSCREEN );
   _setcolor( 7 );
   _floodfill( 50,50,7 );

   Scale( 175, 100, 100, .5, 0, 1, 1, 0 );
   Scale( 290, 100, 100, .75, 0, 1, 0, 0 );

   getch();

   _clearscreen( _GCLEARSCREEN );
   _setcolor( 7 );
   _floodfill( 50,50,7 );

   Ibeam();

   for( i = 0; i < 10; i ++ )
      st[i] = 0;

   i = 0;
   Text( 175, 100, st, 0, &i, 1 );

   getch();

   _clearscreen( _GCLEARSCREEN );
   _setcolor( 7 );
   _floodfill( 50,50,7 );

   w.x1 = 50, w.y1 = 50, w.x2= 600, w.y2 = 420;
   w.stat = 1;
   w.tc = 7;
   w.mb = 1;
   w.typ = 0;

   for( i = 0; i < 10; i ++ )
      w.mu[i][0] = '\0';

   strcpy( w.mu[0], "File" );
   strcpy( w.mu[1], "Edit" );

   strcpy( w.title, "Motif Window" );

   s_ptr();

   while( !kbhit() )
   {
      _clearscreen( _GCLEARSCREEN );
      _setcolor( 7 );
      _floodfill( 50,50,7 );

      Window( w );

      i = -1;
      while( ( i < 0 ) && !kbhit() )
	 i = Mouse( &w );
   }

   getch();

   end_gui();
}
