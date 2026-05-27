/* Test GUI */
#include <graph.h>
#include <string.h>
#include "motfsm.h"
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
   int i, i2, i3, i4, f = 0, kom, x1, y1;
   char op[5][50], ld[10][10];
   struct WI w;
   struct component test[10];

   w.x1 = 10;
   w.y1 = 10;
   w.x2 = 500;
   w.y2 = 400;
   w.stat = 1;
   w.tc = 7;
   w.mb = 0;
   w.typ = 0;
   w.mfc = 7;
   w.mb = 1;
   strcpy( w.mu[0], "File" );
   strcpy( w.mu[1], "Edit" );
   strcpy( w.mu[2], " " );
   strcpy( w.mu[3], " " );
   strcpy( w.mu[4], " " );
   strcpy( w.mu[5], " " );
   strcpy( w.mu[6], " " );
   strcpy( w.mu[7], " " );
   strcpy( w.mu[8], " " );
   strcpy( w.mu[9], "Help" );
   strcpy( w.title, "Test" );

   test[0].c = _RadioButton;
   test[0].x = 50;
   test[0].y = 50;
   test[0].l = 1;
   test[0].v2 = 50;
   test[0].v3 = 100;
   test[0].v4 = -100;
   strcpy( test[0].d, "Radio" );
   test[0].v = 0;
   test[0].v6 = 0;

   test[1].c = _ToggleButton;
   test[1].x = 50;
   test[1].y = 70;
   test[1].l = 100;
   test[1].v2 = 50;
   test[1].v3 = 100;
   test[1].v4 = -100;
   strcpy( test[1].d, "Toggle" );
   test[1].v = 0;
   test[1].v6 = 0;

   test[2].c = _PushButton;
   test[2].x = 50;
   test[2].y = 90;
   test[2].l = 100;
   test[2].v2 = 50;
   test[2].v3 = 100;
   test[2].v4 = -100;
   strcpy( test[2].d, "OK" );
   test[2].v = 0;
   test[2].v6 = 1;

   test[3].c = _OptionButton;
   test[3].x = 50;
   test[3].y = 120;
   test[3].l = 100;
   test[3].v2 = 50;
   test[3].v3 = 100;
   test[3].v4 = -100;
   strcpy( test[3].d, "Explosive" );
   test[3].v = 0;
   test[3].v6 = 4;

   test[4].c = _ScaleH;
   test[4].x = 200;
   test[4].y = 50;
   test[4].l = 100;
   test[4].v = 0;
   test[4].v2 = 50;
   test[4].v3 = 100;
   test[4].v4 = -100;
   test[4].v5 = 1;
   test[4].v6 = 0;

   test[5].c = _ScaleV;
   test[5].x = 400;
   test[5].y = 50;
   test[5].l = 100;
   test[5].v = 0;
   test[5].v2 = 50;
   test[5].v3 = 100;
   test[5].v4 = -100;
   test[5].v5 = 1;
   test[5].v6 = 0;

   test[6].c = _Text;
   test[6].x = 200;
   test[6].y = 100;
   test[6].l = 100;
   test[6].v2 = 50;
   test[6].v3 = 100;
   test[6].v4 = -100;
   for( i = 0; i < 30; i ++ )
      test[6].d[i] = 0;
   test[6].v = 0;
   test[6].v6 = 30;

   test[7].c = _RadioButton;
   test[7].x = 160;
   test[7].y = 50;
   test[7].l = 1;
   test[7].v2 = 50;
   test[7].v3 = 100;
   test[7].v4 = -100;
   strcpy( test[7].d, "B" );
   test[7].v = 1;
   test[7].v6 = 0;

   test[8].c = _PushButton;
   test[8].x = 50;
   test[8].y = 200;
   test[8].l = 0;
   test[8].v2 = 50;
   test[8].v3 = 100;
   test[8].v4 = -100;
   strcpy( test[8].d, "Push" );
   test[8].v = 0;
   test[8].v6 = 0;

   test[9].c = _List;
   test[9].x = 200;
   test[9].y = 250;
   test[9].v = 10;
   test[9].l = 5;
   test[9].v2 = 0;
   test[9].v3 = -1;
   test[9].v4 = 0;
   test[9].v5 = 0;
   test[9].v6 = 4;

   strcpy( ld[0], "Choise 0" );
   strcpy( ld[1], "Choise 1" );
   strcpy( ld[2], "Choise 2" );
   strcpy( ld[3], "Choise 3" );
   strcpy( ld[4], "Choise 4" );
   strcpy( ld[5], "Choise 5" );
   strcpy( ld[6], "Choise 6" );
   strcpy( ld[7], "Choise 7" );
   strcpy( ld[8], "Choise 8" );
   strcpy( ld[9], "Choise 9" );

   for( i = 0; i < 5; i ++ )
      op[i][49] = 0, op[i][48] = 0;

   i = init_gui();
   if( i < 0 )
   {
      printf("Error\n");
      return( 0 );
   }

   i2 = 1;

   while( ( i2 < 2 ) || ( i2 > 3 ) )
   {
      if( ( i2 != 4 ) && ( i2 != 0 ) )
      {
	 _clearscreen( _GCLEARSCREEN );
	 Window( w );
	 for( i = 0; i < 10; i ++ )
	 {
	    if( f == i )
	       draw_comp( w, test[i], 1 );
	    else
	       draw_comp( w, test[i], 0 );

	    if( i == 9 )
	    {
	       i4 = 0;
	       for( i3 = test[i].v2; i3 < test[i].v2 + test[i].l; i3 ++ )
	       {
		  if( test[i].v3 != i3 )
		     _setcolor( 0 );
		  else
		     _setcolor( 7 );

		  if( w.stat == 1 )
		     _moveto( w.x1 + test[i].x + 1, w.y1 + test[i].y + ( i4 *
			   11 ) );

		  if( w.stat == 2 )
		     _moveto( test[i].x + 1, test[i].y + ( i4 * 11 ) );

		  _outgtext( ld[i3] );
		  i4 ++;
	       }
	    }
	 }
      }

      i2 = 0;
      i2 = q_act( &w, test, 10, 1, &f, &kom );

      if( i2 == 5 )
      {
	 if( test[f].c == _List )
	 {
	    draw_comp( w, test[f], 1 );
	    i4 = 0;
	    for( i3 = test[f].v2; i3 < test[f].v2 + test[f].l; i3 ++ )
	    {
	       if( test[f].v3 != i3 )
		  _setcolor( 0 );
	       else
		  _setcolor( 7 );

	       if( w.stat == 1 )
		  _moveto( w.x1 + test[f].x + 1, w.y1 + test[f].y + ( i4 *
			11 ) );

	       if( w.stat == 2 )
		  _moveto( test[f].x + 1, test[f].y + ( i4 * 11 ) );

	       _outgtext( ld[i3] );
	       i4 ++;
	    }
	 }
	 i2 = 4;
	 continue;
      }

      if( w.stat == 1 )
	 x1 = w.x1, y1 = w.y1;
      if( w.stat == 2 )
	 x1 = 0, y1 = 15;

      if( i2 < 0 )
      {
       i2 = -i2;
       i2 = i2 - 1;

       i3 = 0;
       while( 1 )
       {
	 if( i2 == 0 )
	 {
	    if( i3 )
	    {
	       _clearscreen( _GCLEARSCREEN );
	       Window( w );
	       for( i = 0; i < 10; i ++ )
	       {
		  if( f == i )
		     draw_comp( w, test[i], 1 );
		  else
		     draw_comp( w, test[i], 0 );

		  if( i == 9 )
		  {
		     i4 = 0;
		     for( i3 = test[i].v2; i3 < test[i].v2 + test[i].l;
			  i3 ++ )
		     {
			if( test[i].v3 != i3 )
			   _setcolor( 0 );
			else
			   _setcolor( 7 );

			if( w.stat == 1 )
			   _moveto( w.x1 + test[i].x + 1, w.y1 + test[i].y +
				    ( i4 * 11 ) );

			if( w.stat == 2 )
			   _moveto( test[i].x + 1, test[i].y + ( i4 * 11 ) );

			_outgtext( ld[i3] );
			i4 ++;
		     }
		  }
	       }
	       HighlightMenu( w, i2 );
	    }
	    else
	       i3 = 1;

	    strcpy( op[0], "New" );
	    strcpy( op[1], "Open..." );
	    strcpy( op[2], "Save" );
	    strcpy( op[3], "Save As..." );
	    strcpy( op[4], "Exit" );

	    if( !kom )
	       i = m_bar_Menu( w, i2, op, 5, -1 );
	    else
	       i = m_bar_Menu( w, i2, op, 5, 1 );

	    if( i == -2 )
	    {
	       i2 --;
	       if( i2 < 0 )
		  i2 = 1;

	       kom = 1;
	       continue;
	    }
	    if( i == -3 )
	    {
	       i2 ++;
	       if( i2 > 1 )
		  i2 = 0;
	       kom = 1;
	       continue;
	    }

	    if( i == 4 )
	       i2 = 3;
	    else
	       i2 = 1;

	    break;
	 }
	 if( i2 == 1 );
	 {
	    if( i3 )
	    {
	       _clearscreen( _GCLEARSCREEN );
	       Window( w );
	       for( i = 0; i < 10; i ++ )
	       {
		  if( f == i )
		     draw_comp( w, test[i], 1 );
		  else
		     draw_comp( w, test[i], 0 );

		  if( i == 9 )
		  {
		     i4 = 0;
		     for( i3 = test[i].v2; i3 < test[i].v2 + test[i].l; i3 ++ )
		     {
			if( test[i].v3 != i3 )
			   _setcolor( 0 );
			else
			   _setcolor( 7 );

			if( w.stat == 1 )
			   _moveto( w.x1 + test[i].x + 1, w.y1 + test[i].y +
				 ( i4 * 11 ) );

			if( w.stat == 2 )
			   _moveto( test[i].x + 1, test[i].y + ( i4 * 11 ) );

			_outgtext( ld[i3] );
			i4 ++;
		     }
		  }
	       }
	       HighlightMenu( w, i2 );
	    }
	    else
	       i3 = 1;

	    strcpy( op[0], "Undo" );
	    strcpy( op[1], "Cut" );
	    strcpy( op[2], "Copy" );
	    strcpy( op[3], "Paste" );
	    strcpy( op[4], "Clear" );

	    if( !kom )
	       i = m_bar_Menu( w, i2, op, 5, -1 );
	    else
	       i = m_bar_Menu( w, i2, op, 5, 1 );

	    if( i == -2 )
	    {
	       i2 --;
	       if( i2 < 0 )
		  i2 = 1;
	       kom = 1;
	       continue;
	    }
	    if( i == -3 )
	    {
	       i2 ++;
	       if( i2 > 1 )
		  i2 = 0;
	       kom = 1;
	       continue;
	    }

	    i2 = 1;

	    break;
	 }
       }
       continue;
      }

      if( test[3].v )
      {
	 strcpy( op[0], "Cat" );
	 strcpy( op[1], "Dog" );
	 strcpy( op[2], "Chicken" );
	 strcpy( op[3], "Rat" );
	 strcpy( op[4], "Explosive" );

	 if( w.stat == 1 )
	    i = OptionMenu( test[3].x + w.x1, test[3].y + w.y1 + 15, op, 5, 1,
		test[3].v6 );
	 if( w.stat == 2 )
	    i = OptionMenu( test[3].x, test[3].y + 15, op, 5, 1, test[3].v6 );

	 if( i > -1 )
	 {
	    strcpy( test[3].d, op[i] );
	    test[3].v6 = i;
	 }

	 test[3].v = 0;
	 i2 = 1;
      }

      if( test[8].v )
	 test[8].v = 0;

      if( ( w.stat == 0 ) || ( w.stat == 3 ) )
	 i2 = 3;

      if( test[2].v )
	 i2 = 3;
   }

   end_gui();

   printf("%sed\n",( i2 == 2 )?"Cancel":"Ok-");
}
