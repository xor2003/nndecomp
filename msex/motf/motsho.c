/* Motif graphic promoter */
#include <graph.h>
#include <string.h>
#include "motfsm.h"
#include "mouse.h"

main()
{
   int f, i, i2;
   struct WI w;
   struct component c[2];

   w.x1 = 50, w.y1 = 50;
   w.x2 = 500, w.y2 = 200;
   w.typ = 1;
   w.mb = 0;
   w.stat = 1;
   w.mfc = 7, w.tc = 7;
   strcpy( w.title, "OSF/Motif Window" );

   c[0].c = _PushButton;
   c[0].x = 10, c[0].y = 70;
   strcpy( c[0].d, "OK" );
   c[0].v = 0;
   c[0].v6 = 1;

   c[1].c = _PushButton;
   c[1].x = 150, c[1].y = 70;
   strcpy( c[1].d, "Cancel" );
   c[1].v = 0;
   c[1].v6 = 0;

   f = 0;
   init_gui();
   _setvideomode( _MRES16COLOR );
   MouseInit();

   while( ( i2 != 3 ) && ( i2 != 2 ) )
   {
      if( i2 != 4 )
      {
	 _clearscreen( _GCLEARSCREEN );

	 Window( w );

	 if( f == 0 )
	    i = 1;
	 else
	    i = 0;

	 draw_comp( w, c[0], i );
	 draw_comp( w, c[1], !i );

	 _moveto( w.x1 + 10, w.y1 + 20 );
	 _outgtext( "Support Standardness.");
	 _moveto( w.x1 + 10, w.y1 + 40 );
	 _outgtext( "Support OSF/Motif; the standard GUI.");
      }
      i2 = i_act( &w, c, 2, 1, &f );

      if( ( c[0].v ) || ( c[1].v ) )
      {
	 i2 = 3;
      }
      if( w.stat == 0 )
      {
	 i2 = 3;
      }
   }

   end_gui();
}
