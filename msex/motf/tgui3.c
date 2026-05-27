/* Test GUI */
#include <graph.h>
#include <string.h>
#include "mouse.h"
#include "motfsm.h"

main()
{
   struct WI w;
   struct component c[1];
   int i, i2, f, k;

   w.x1 = 10, w.y1 = 10;
   w.x2 = 500, w.y2 = 400;
   w.stat = 1;
   w.mb = 0;
   w.tc = 7;
   w.mfc = 7;

   strcpy( w.title, "Test" );

   c[0].c = _PushButton;
   c[0].x = 10;
   c[0].y = 300;
   c[0].v = 0;
   c[0].v6 = 1;
   strcpy( c[0].d, "OK" );

   init_gui();

   i = 1;

   f = 0;

   while( 1 )
   {
      if( i )
      {
	 _clearscreen(_GCLEARSCREEN );
	 Window( w );
	 draw_comp( w, c[0], f == 0 );
	 i = 0;
      }

      i2 = q_act( &w, c, 1, 1, &f, &k );

      i = 0;

      if( ( i2 == 5 ) || ( i2 == 1 ) )
	 i = 1;

      if( ( i2 == 2 ) || ( i2 == 3 ) )
	 break;

      if( c[0].v )
	 break;

      if( ( w.stat < 1 ) || ( w.stat > 2 ) )
	 break;
   }

   end_gui();
}
