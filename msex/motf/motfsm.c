/* Graphic user interface windowing system, designed to look
 * like OSF/Motif */

#include <graph.h>
#include <bios.h>
#include <malloc.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include "sound.h"
#include "mouse.h"
#include "motfsm.h"

int init_gui( void )
{
   int i;

   /* Font initiatialization */
   i=_registerfonts("*.fon");
   if( i < 0 )
   {
      return(i);
   }
   i=_setfont("fh10w8b");
   if(i<0)
      return(-5);
   /* Graphics initialization */
   i=_setvideomode(_MAXRESMODE);
   if(i==0)
      return(-4);
   /* Mouse initialization */
   if(!(MouseInit()))
   {
      /* No mouse active */
      return(-6);
   }
   return(0);
}

int end_gui( void )
{
   _unregisterfonts();
   _setvideomode(_DEFAULTMODE);
}

int PulldownMenuD( int x, int y, char op[][50], int n )
{
   int i;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);
   _setcliprgn( x - 1, y - 1, x + 201, y + ( n * 15 ) + 1 );
   _clearscreen(_GVIEWPORT);

   _setcolor( 7 );
   _rectangle(_GFILLINTERIOR, x, y, x + 200, y + ( n * 15 ) );

   _setcolor( 15 );
   _moveto( x, y + ( n * 15 ) );
   _lineto( x, y );
   _lineto( x + 200, y );

   _setcolor( 8 );
   _moveto( x + 200, y );
   _lineto( x + 200, y + ( n * 15 ) );
   _lineto( x, y + ( n * 15 ) );

   _setcolor( 0 );
   _rectangle( _GBORDER, x - 1, y - 1, x + 201, y + ( n * 15 ) + 1 );
   for( i = 0; i < n; i ++ )
   {
      if( !op[i][48] )
	 _setcolor( 0 );
      else
	 _setcolor( 8 );
      _moveto( x + 5, y + ( i * 15 ) );
      _outgtext(op[i]);
      if( op[i][49] )
      {
	 _setcolor( 15 );
	 _moveto( x + 184, y + 13 + ( i * 15 ) );
	 _lineto( x + 184, y + 5 + ( i * 15 ) );
	 _lineto( x + 194, y + 10 + ( i * 15 ) );

	 _setcolor( 8 );
	 _lineto( x + 184, y + 13 + ( i * 15 ) );
      }
   }

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );
   SetPtrVis(SHOW);
}


int h_glass( void )
{
   PTRSHAPE *ps;
   int i;

   ps->g.xHot=0;
   ps->g.yHot=0;

   for( i = 0; i < 32; i ++ )
      ps->g.afsPtr[i] = -1;

   /* Motif Hourglass */
   ps->g.afsPtr[16] = 0x0;
   ps->g.afsPtr[17] = 0x1ffc;
   ps->g.afsPtr[18] = 0x1ffc;
   ps->g.afsPtr[19] = 0xff8;
   ps->g.afsPtr[20] = 0x7f0;
   ps->g.afsPtr[21] = 0x3e0;
   ps->g.afsPtr[22] = 0x1c0;
   ps->g.afsPtr[23] = 0x80;
   ps->g.afsPtr[24] = 0x1c0;
   ps->g.afsPtr[25] = 0x3e0;
   ps->g.afsPtr[26] = 0x7f0;
   ps->g.afsPtr[27] = 0xff8;
   ps->g.afsPtr[28] = 0x1ffc;
   ps->g.afsPtr[29] = 0x1ffc;
   ps->g.afsPtr[30] = 0x0;
   ps->g.afsPtr[31] = 0x0;

   SetPtrVis(HIDE);
   SetPtrShape(ps);
   SetPtrVis(SHOW);
}

int s_ptr( void )
{
   EVENT e;
   int x, y;

   GetPtrPos( &e );
   x = e.x;
   y = e.y;

   SetPtrVis(HIDE);
   MouseInit();
   SetPtrVis(SHOW);

   SetPtrPos( x, y );
}

int Ibeam( void )
{
   PTRSHAPE ps;
   int i;

   ps.g.xHot=0;
   ps.g.yHot=0;

   for( i = 0; i < 32; i ++ )
      ps.g.afsPtr[i] = -1;

   /* Motif I-beam */
   ps.g.afsPtr[16] = 0x0;
   ps.g.afsPtr[17] = 0x0;
   ps.g.afsPtr[18] = 0x7c0;
   ps.g.afsPtr[19] = 0x100;
   ps.g.afsPtr[20] = 0x100;
   ps.g.afsPtr[21] = 0x100;
   ps.g.afsPtr[22] = 0x100;
   ps.g.afsPtr[23] = 0x100;
   ps.g.afsPtr[24] = 0x100;
   ps.g.afsPtr[25] = 0x100;
   ps.g.afsPtr[26] = 0x100;
   ps.g.afsPtr[27] = 0x100;
   ps.g.afsPtr[28] = 0x100;
   ps.g.afsPtr[29] = 0x7c0;
   ps.g.afsPtr[30] = 0x0;
   ps.g.afsPtr[31] = 0x0;

   SetPtrVis(HIDE);
   SetPtrShape(&ps);
   SetPtrVis(SHOW);
}

int e_b_mnu( int x, int y, int n )
{
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);
   _setcliprgn( x, y, x + 200, y + ( n * 15 ) );
   _clearscreen(_GVIEWPORT);

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );
   SetPtrVis(SHOW);
}

int u_btn( int x, int y, char *nm )
{
   int mx, my;
   EVENT e;

   e.fsBtn = 0;
   GetPtrPos( &e );
   mx = e.x;
   my = e.y;

   if( e.fsBtn )
   {
      if( if_btn( x, y, mx, my ) )
      {
	 PushButton( x, y, nm, 1, 0, 0 );

	 do
	 {
	    e.fsBtn = 0;
	    GetPtrPos( &e );
	    mx = e.x;
	    my = e.y;

	    if( !if_btn( x, y, mx, my ) )
	    {
	       PushButton( x, y, nm, 0, 0, 0 );
	       return( 0 );
	    }
	 }while( e.fsBtn );

	 PushButton( x, y, nm, 0, 0, 0 );
	 if( if_btn( x, y, mx, my ) )
	    return( 1 );
      }
   }
   return( 0 );
}

int m_bar_Menu( struct WI w, int n, char op[][50], int num, int p )
{
   EVENT e;
   int i, i2, i3, x, y, p2;

   p2 = p;

   if( p < 1 )
   {
      GetPtrPos( &e );
      if( e.fsBtn == 2 )
      {
	 p2 = 1;
	 wait_for_release();
      }
   }

   if( w.stat == 1 )
      x = w.x1, y = w.y1;
   if( w.stat == 2 )
      x = 0, y = 0;

   i2 = 0;
   for( i = 0; i < n; i ++ )
   {
      i2 += strlen( w.mu[i] ) + 1;
   }

   i2 *= 8;

   i3 = strlen( w.mu[n] ) * 8;

   if( p2 < 1 )
      PulldownMenuD( x + i2, y + 27, op, num );

   SetPtrVis( SHOW );

   if( p2 < 1 )
      while( ptr_in_zn( x + i2, y + 15, x + i2 + i3, y + 27, 1 ) )
	 ;

   i = PulldownMenu( x + i2, y + 27, op, num, p2 );

   return( i );
}

int ptr_in_zn( int x1, int y1, int x2, int y2, int b )
{
   EVENT e;

   GetPtrPos( &e );

   if( b )
   {
      if( b == -1 )
      {
	 if( !e.fsBtn )
	    return( 0 );
      }
      else
      {
	 if( b != e.fsBtn )
	    return( 0 );
      }
   }

   if( ( e.x > x1 ) && ( e.x < x2 ) && ( e.y > y1 ) && ( e.y < y2 ) )
      return( 1 );
   else
      return( 0 );
}

int WindowMenu( struct WI *w, int p )
{
   EVENT e;
   int i, i2, x, y, p2, x2, y2, xl, yl, i5;
   char mu[6][50];
   char k;

   p2 = p;

   GetPtrPos( &e );

   if( e.fsBtn == 2 )
   {
      p2 = 1;
      wait_for_release();
   }

   for( i = 0; i < 6; i ++ )
   {
      mu[i][0] = '\0', mu[i][49] = '\0';
   }

   strcpy( mu[0], "Restore" );
   strcpy( mu[1], "Move" );
   strcpy( mu[2], "Size" );
   strcpy( mu[3], "Minimize" );
   strcpy( mu[4], "Maximize" );
   strcpy( mu[5], "Close" );

   if( w->typ )
   {
      mu[0][48] = 1;
      mu[1][48] = 0;
      mu[2][48] = 1;
      mu[3][48] = 1;
      mu[4][48] = 1;
      mu[5][48] = 0;
   }
   else
   {
      mu[0][48] = 0;
      mu[1][48] = 0;
      mu[2][48] = 0;
      mu[3][48] = 0;
      mu[4][48] = 0;
      mu[5][48] = 0;
   }

   if( w->stat == 2 )
   {
      x = 0;
      y = 0;
   }
   else
   {
      x = w->x1;
      y = w->y1;
   }

   if( p2 < 1 )
      PulldownMenuD( x, y + 13, mu, 6 );

   SetPtrVis( SHOW );

   if( p2 < 1 )
      while( ptr_in_zn( x, y, x + 11, y + 11, -1 ) )
	 ;

   i = PulldownMenu( x, y + 13, mu, 6, p2 );

   switch( i )
   {
      case 0:
	 /* Restore */
	 w->stat = 1;
	 return( i );
      case 1:
	 /* Move */
	 k = '\0';
	 x2 = w->x1, y2 = w->y1;
	 xl = w->x2 - w->x1, yl = w->y2 - w->y1;
	 while( 1 )
	 {
	    k = getch();
	    if( k == '\r' )
	       break;
	    if( k == ' ' )
	       break;

	    if( ( k == 0x0e ) || ( k == 0 ) )
	    {
	       k = getch();

	       _setcolor( 15 );
	       i5 = _getwritemode();
	       _setwritemode( _GXOR );

	       SetPtrVis( HIDE );
	       _rectangle(_GBORDER, x2, y2, x2 + xl, y2 + yl );
	       SetPtrVis( SHOW );

	       _setwritemode( i5 );

	       switch( k )
	       {
		  case 0x48: /* Up */
		     y2 -= 5;
		     break;
		  case 0x50: /* Down */
		     y2 += 5;
		     break;
		  case 0x4b: /* Left */
		     x2 -= 5;
		     break;
		  case 0x4d: /* Right */
		     x2 += 5;
		     break;
		  default:
		     break;
	       }
	    }

	    i5 = _getwritemode();
	    _setwritemode( _GXOR );

	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x2, y2, x2 + xl, y2 + yl );
	    SetPtrVis( SHOW );

	    _setwritemode( i5 );
	 }
	 w->x1 = x2, w->y1 = y2;
	 w->x2 = x2 + xl, w->y2 = y2 + yl;
	 return( i );
      case 3:
	 /* Minimize */
	 w->stat = 3;
	 return( i );
      case 4:
	 /* Maximize */
	 w->stat = 2;
	 return( i );
      case 5:
	 /* Close */
	 w->stat = 0;
	 return( i );
      default:
	 return( i );
   }
}

int OptionMenu( int x, int y, char op[][50], int n, int p, int c )
{
   char str[50];
   int i;

   strcpy( str, op[0] );
   strcpy( op[0], op[c] );
   strcpy( op[c], str );

   i = PulldownMenu( x, y, op, n, p );
   return( i );
}

int PulldownMenu( int x, int y, char op[][50], int n, int p )
{
   int i, xc, yc, y2, str, i2, i3;
   EVENT e;

   i2 = 0;
   GetPtrPos( &e );
   SetPtrVis(SHOW);

   i2 = 0;
   for( i = 0; i < n; i ++ )
   {
      if( op[i][48] )
	 i2 ++;
   }

   if( i2 >= n )
   {
      return( -1 );
   }

   if( e.fsBtn == 2 )
   {
      i2 = 1;
   }

   /* Draw Menu */
   PulldownMenuD( x, y, op, n );

   e.fsBtn = 0;

   if( !i2 )
      for( i = 0; i < 10000; i ++ )
	 ;

   GetPtrPos( &e );
   SetPtrVis(SHOW);

   if( p < 0 )
   {
      i3 = 0;
      i3 = ( e.fsBtn == 2 );
   }
   else
   {
      i3 = p;
   }

   if( ( i2 == 1 ) || ( i3 ) )
   {
      i = 0;
      i3 = 0;

      while( op[i][48] )
      {
	 i ++;

	 if( i >= n )
	    i = 0;
      }

      _setcolor( 8 );
      y2 = y + ( i * 15 );
      if( !op[i][49] )
	 lbtnl( x, y2, op[i], 1 );
      else
	 CascadeButton( x, y2, op[i], 1 );

      while( 1 )
      {
	 GetPtrPos( &e );
	 if( e.fsBtn )
	 {
	    xc = e.x;
	    yc = e.y;
	    break;
	 }

	 i3 = i;
	 if( kbhit() )
	 {
	    i2 = getch();
	    if( ( i2 == 0 ) || ( i2 == 0xe0 ) )
	    {
	       i2 = getch();
	       switch( i2 )
	       {
		  case 0x44:   /* F10 - unpost menu */
		     return( -1 );
		  case 0x4b:   /* Left */
		     return( -2 );
		  case 0x4d:   /* Right */
		     if( op[i][49] )
		     {
			return( i );
		     }
		     return( -3 );
		  case 0x48:   /* Up */
		     i --;

		     while( op[i][48] )
		     {
			i --;

			if( i < 0 )
			   i = n - 1;
		     }

		     if( i < 0 )
			i = n - 1;

		     break;
		  case 0x50:   /* Down */
		     i ++;

		     if( i >= n )
			i = 0;

		     while( op[i][48] )
		     {
			i ++;

			if( i >= n )
			   i = 0;
		     }

		     if( i >= n )
			i = 0;

		     break;
	       }
	    }
	    else
	    {
	       switch( i2 )
	       {
		  case 0x1b:    /* Esc*/
		     return( -1 );
		  case '\r':    /* Enter/Return */
		  case ' ':     /* Select/Space */
		     return( i );
	       }
	    }
	    SetPtrVis(HIDE);
	    _setcolor( 8 );
	    y2 = y + ( i * 15 );
	    if( !op[i][49] )
	       lbtnl( x, y2, op[i], 1 );
	    else
	       CascadeButton( x, y2, op[i], 1 );

	    _setcolor( 7 );
	    y2 = y + ( i3 * 15 );
	    _rectangle( _GFILLINTERIOR, x, y2, x + 200, y2 + 15 );

	    _setcolor( 15 );
	    _moveto( x, y + ( n * 15 ) );
	    _lineto( x, y );
	    _lineto( x + 200, y );

	    _setcolor( 8 );
	    _moveto( x + 200, y );
	    _lineto( x + 200, y + ( n * 15 ) );
	    _lineto( x, y + ( n * 15 ) );

	    _setcolor( 0 );
	    _rectangle( _GBORDER, x - 1, y - 1, x + 201, y + ( n * 15 ) + 1 );

	    _setcolor( 0 );
	    _moveto( x + 5, y2 + 2 );
	    _outgtext( op[i3] );
	    if( op[i3][49] )
	    {
	       _setcolor( 15 );
	       _moveto( x + 184, y2 + 13 );
	       _lineto( x + 184, y2 + 5 );
	       _lineto( x + 194, y2 + 10 );

	       _setcolor( 8 );
	       _lineto( x + 184, y2 + 13 );
	    }

	    SetPtrVis(SHOW);
	 }
      }
   }
   else
   {
      while( 1 )
      {
	 GetPtrPos( &e );
	 xc = e.x, yc = e.y;

	 if( !e.fsBtn )
	    break;

	 if( ( xc > x + 200 ) || ( xc < x ) || ( yc > y + ( n * 15 ) ) ||
	     ( yc < y ) )
	 {
	    return( -1 );
	 }

	 for( i = 0; i < n; i ++ )
	 {
	    y2 = y + ( i * 15 );
	    if( if_lbtn( x, y2, xc, yc ) )
	    {
	       if( !op[i][48] )
	       {
		  if( _getpixel( x+1, y2+1 ) != 8 )
		  {
		     SetPtrVis(HIDE);
		     _setcolor( 8 );
		     if( !op[i][49] )
			lbtnl( x, y2, op[i], 1 );
		     else
			CascadeButton( x, y2, op[i], 1 );
		     SetPtrVis(SHOW);
		  }
	       }
	    }
	    else
	    {
	       if( _getpixel( x + 1, y2 + 1 ) != 7 )
	       {
		  SetPtrVis(HIDE);
		  _setcolor( 7 );
		  _rectangle( _GFILLINTERIOR, x, y2, x + 200, y2 + 15 );

		  _setcolor( 15 );
		  _moveto( x, y + ( n * 15 ) );
		  _lineto( x, y );
		  _lineto( x + 200, y );

		  _setcolor( 8 );
		  _moveto( x + 200, y );
		  _lineto( x + 200, y + ( n * 15 ) );
		  _lineto( x, y + ( n * 15 ) );

		  _setcolor( 0 );
		  _rectangle( _GBORDER, x - 1, y - 1, x + 201, y + ( n * 15 ) + 1 );

		  if( !op[i][48] )
		     _setcolor( 0 );
		  else
		     _setcolor( 8 );

		  _moveto( x + 5, y2 + 2 );
		  _outgtext( op[i] );
		  if( op[i][49] )
		  {
		     _setcolor( 15 );
		     _moveto( x + 184, y2 + 13 );
		     _lineto( x + 184, y2 + 5 );
		     _lineto( x + 194, y2 + 10 );

		     _setcolor( 8 );
		     _lineto( x + 184, y2 + 13 );
		  }
		  SetPtrVis(SHOW);
	       }
	    }
	 }
      }
   }
   if( ( !i2 ) && ( e.fsBtn > 2 ) )
   {
      return( -1 );
   }
   for( i = 0; i < n; i ++ )
   {
      y2 = y + ( i * 15 );
      if( if_lbtn( x, y2, xc, yc ) )
      {
	 if( op[i][48] )
	    return( -1 );

	 SetPtrVis(HIDE);

	 PulldownMenuD( x, y, op, n );

	 SetPtrVis(SHOW);

	 SetPtrVis(HIDE);
	 _setcolor( 8 );
	 if( !op[i][49] )
	    lbtnl( x, y2, op[i], 1 );
	 else
	    CascadeButton( x, y2, op[i], 1 );
	 SetPtrVis(SHOW);

	 return( i );
      }
   }

   return( -1 );
}

int if_btn( int x, int y, int xc, int yc )
{
   if( ( xc > x ) && ( yc > y ) && ( xc < x + 100 ) && ( yc < y + 15 ) )
      return( 1 );
   else
      return( 0 );
}

int LocationCursor( struct WI w, struct component c, int tog )
{
   int x1, y1, x, y, i;

   if( ( w.stat == 3 ) || ( w.stat == 0 ) )
      return( 1 );

   x = c.x, y = c.y;

   if( w.stat == 2 )
      x += 0, y += 0;
   else
      x += w.x1, y += w.y1;

   if( tog )
      _setcolor( 0 );
   else
      _setcolor( w.mfc );

   SetPtrVis( HIDE );
   switch( c.c )
   {
      case _PushButton:
	 _rectangle( _GBORDER, x - 7,  y - 7, x + 107, y + 22 );
	 break;
      case _OptionButton:
	 _rectangle( _GBORDER, x - 2, y - 2, x + 102, y + 17 );
	 break;
      case _ScaleH:
	 _rectangle( _GBORDER, x - 4, y - 2, x + c.l + 14, y + 11 );
	 break;
      case _ScaleV:
	 _rectangle( _GBORDER, x - 2, y - 4, x + 11, y + c.l + 14 );
	 break;
      case _Text:
	 _rectangle( _GBORDER, x - 4, y - 4, x + 104, y + 19 );
	 break;
      case _ToggleButton:
	 i = strlen( c.d );
	 i *= 8;
	 _rectangle( _GBORDER, x - 2, y - 2, x + i + 17, y + 12 );
	 break;
      case _RadioButton:
	 i = strlen( c.d );
	 i *= 8;
	 _rectangle( _GBORDER, x - 2, y - 2, x + i + 17, y + 12 );
	 break;
      case _List:
	 if( ( c.v6 <= c.v2 + c.l ) && ( c.v6 >= c.v2 ) )
	 {
	    i = c.v6 - c.v2;
	    _rectangle( _GBORDER, x, y + ( i * 11 ), x + 120, y + ( i * 11 ) + 10 );
	 }
	 break;
      default:
	 break;
   }
   SetPtrVis( SHOW );
}

int Scale( int x, int y, int l, double p, double n, double ax, int hl, int f )
{
   double np, sch, sch2, sch3;
   int i, i2, i3;
   char str[10];

   if( l <= 10 )
   {
      return( 1 );
   }

   /* Locate slider position */
   sch = ax - n;
   sch2 = p - n;

   sch = sch2 / sch;
   sch *= l;
   i = sch;

   /* Horizontal */
   if( hl )
   {
      i3 = _getpixel( x - 5, y );
      _setcolor( i3 );
      _rectangle( _GFILLINTERIOR, x - 2, y - 14, x + l + 12, y + 9 );

      _setcolor( 0 );
      _rectangle( _GBORDER, x - 2, y, x + l + 12, y + 9 );

      /* Trough */
      _setcolor( 8 );
      _moveto( x-1, y + 8 );
      _lineto( x-1, y + 1 );
      _lineto( x + l + 11, y + 1 );

      _setcolor( 15 );
      _moveto( x + l + 11, y + 1 );
      _lineto( x + l + 11, y + 8 );
      _lineto( x - 1, y + 8 );

      /* Slider */
      _setcolor( 15 );
      _moveto( x + i, y + 7 );
      _lineto( x + i, y + 2 );
      _lineto( x + i + 10, y + 2 );

      _setcolor( 8 );
      _moveto( x + i + 10, y + 2 );
      _lineto( x + i + 10, y + 7 );
      _lineto( x + i, y + 7 );

      _setcolor( 0 );
      _moveto( x + i + 5, y + 3 );
      _lineto( x + i + 5, y + 6 );

      /* Value Readout */
      sprintf(str,"%g",p);

      i2 = ( strlen( str ) * 8 ) / 2;

      _setcolor( 0 );
      _moveto( x + ( l / 2 ) - i2, y - 13 );
      _outgtext( str );

      if( f )
      {
	 _setcolor( 0 );
	 _rectangle( _GBORDER, x - 4, y - 2, x + l + 14, y + 11 );
      }
   }
   /* Vertical */
   else
   {
      /* Locate slider position */
      sch3 = -p;
      sch = ax - n;
      sch2 = sch3 - n;

      sch = sch2 / sch;
      sch *= l;
      i = sch;

      _setcolor( 0 );

      i3 = _getpixel( x + 15, y );
      _setcolor( i3 );

      _rectangle( _GFILLINTERIOR, x - 83, y - 2, x + 9, y + l + 12 );

      _setcolor( 0 );
      _rectangle( _GBORDER, x, y - 2, x + 9, y + l + 12 );

      /* Trough */
      _setcolor( 8 );
      _moveto( x + 8, y - 1 );
      _lineto( x + 1, y - 1 );
      _lineto( x + 1, y + l + 11 );

      _setcolor( 15 );
      _moveto( x + 1, y + l + 11 );
      _lineto( x + 8, y + l + 11 );
      _lineto( x + 8, y - 1 );

      /* Slider */
      _setcolor( 15 );
      _moveto( x + 7, y + i );
      _lineto( x + 2, y + i );
      _lineto( x + 2, y + i + 10 );

      _setcolor( 8 );
      _moveto( x + 2, y + i + 10 );
      _lineto( x + 7, y + i + 10 );
      _lineto( x + 7, y + i );

      _setcolor( 0 );
      _moveto( x + 3, y + i + 5 );
      _lineto( x + 6, y + i + 5 );

      /* Value Readout */
      sprintf(str,"%g",p);

      _setcolor( 0 );
      i2 = 3;
      i2 += strlen( str ) * 8;

      _moveto( x - i2, y + ( l / 2 ) );
      _outgtext( str );

      if( f )
      {
	 _setcolor( 0 );
	 _rectangle( _GBORDER, x - 2, y - 4, x + 11, y + l + 14 );
      }
   }
}

int if_lbtn( int x, int y, int xc, int yc )
{
   if( ( xc > x ) && ( yc > y ) && ( xc < x + 200 ) && ( yc < y + 15 ) )
      return( 1 );
   else
      return( 0 );
}


int wait_for_release( )
{
   EVENT ev;
   int i2;

   i2 = 1;
   while( i2 )
   {
      i2 = 0;
      ev.fsBtn = 0;

      GetPtrPos( &ev );

      i2 = ev.fsBtn;
      ev.fsBtn = 0;
   }
}

int loc_rel( int *x, int *y )
{
   EVENT ev;
   int i2;

   i2 = 1;
   while( i2 )
   {
      i2 = 0;
      ev.fsBtn = 0;

      GetPtrPos( &ev );

      i2 = ev.fsBtn;
      ev.fsBtn = 0;
   }
   *x = ev.x;
   *y = ev.y;
}

int loc_cl( int *x, int *y )
{
   EVENT ev;
   int i2;

   i2 = 0;
   while( !i2 )
   {
      i2 = 0;
      ev.fsBtn = 0;

      GetPtrPos( &ev );

      i2 = ev.fsBtn;
      ev.fsBtn = 0;
   }
   *x = ev.x;
   *y = ev.y;
}

int sbarv( int x, int y, int l, double p, double fra )
{
   int v1, v2;
   double sch;

   /* Determine slider length */
   sch = l * fra;
   v1 = sch;
   v1 /= 2;

   /* Determine slider position */
   sch = ( l - 2 * v1 ) * p;
   v2 = sch;
   v2 += v1;

   SetPtrVis( HIDE );
   /* Clear Scrolling area */
   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y + 15, x + 10, y + l + 15 );

   _setcolor( 15 );
   _moveto( x - 1, y + l + 31 );
   _lineto( x + 11, y + l + 31 );
   _lineto( x + 11, y - 1 );

   _setcolor( 8 );
   _lineto( x - 1, y - 1 );
   _lineto( x - 1, y + l + 31 );

   /* Left Arrow */
   _setcolor( 7 );
   _moveto( x + 5, y );
   _lineto( x, y + 15 );
   _lineto( x + 10, y + 15 );
   _lineto( x + 5, y );
   _floodfill( x + 5, y + 14, 7 );
   _setcolor( 0 );
   _moveto( x + 5, y );
   _lineto( x, y + 15 );
   _lineto( x + 10, y + 15 );
   _lineto( x + 5, y );
   _setcolor( 15 );
   _moveto( x + 5, y + 1 );
   _lineto( x + 1, y + 14 );
   _setcolor( 8 );
   _lineto( x + 9, y + 14 );
   _lineto( x + 5, y + 1 );

   /* slider */
   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y + v2 - v1 + 15, x + 10, y + v2 + v1 + 15 );
   _setcolor( 0 );
   _rectangle( _GBORDER, x, y + v2 - v1 + 15, x + 10, y + v2 + v1 + 15 );

   _setcolor( 15 );
   _moveto( x + 9, y + v2 - v1 + 1 + 15 );
   _lineto( x + 1, y + v2 - v1 + 1 + 15 );
   _lineto( x + 1, y + v2 + v1 - 1 + 15 );

   _setcolor( 8 );
   _lineto( x + 9, y + v2 + v1 - 1 + 15 );
   _lineto( x + 9, y + v2 - v1 + 1 + 15 );

   /* Right Arrow */
   _setcolor( 7 );
   _moveto( x + 5, y + l + 30 );
   _lineto( x, y + l + 15 );
   _lineto( x + 10, y + l + 15 );
   _lineto( x + 5, y + l + 30 );
   _floodfill( x + 5, y + l + 16, 7 );
   _setcolor( 0 );
   _moveto( x + 5, y + l + 30 );
   _lineto( x, y + l + 15 );
   _lineto( x + 10, y + l + 15 );
   _lineto( x + 5, y + l + 30 );
   _setcolor( 15 );
   _moveto( x + 5, y + l + 29 );
   _lineto( x + 1, y + l + 16 );
   _lineto( x + 9, y + l + 16 );
   _setcolor( 8 );
   _lineto( x + 5, y + l + 29 );

   SetPtrVis( SHOW );
}

int draw_comp( struct WI w, struct component c, int f )
{
   int x, y, i, i2;

   if( ( w.stat == 3 ) || ( w.stat == 0 ) )
      return( 0 );

   if( w.stat == 2 )
      x  = 0, y = 0;
   else
      x = w.x1, y = w.y1;

   switch( c.c )
   {
      case _PushButton:
	 PushButton( x + c.x, y + c.y, c.d, 0, c.v6, f );
	 break;
      case _OptionButton:
	 OptionButton( x + c.x, y + c.y, c.d, 0, f );
	 break;
      case _ScrollBarH:
	 sbarh( x + c.x, y + c.y, c.l, c.v2, c.v3 );
	 break;
      case _ScrollBarV:
	 sbarv( x + c.x, y + c.y, c.l, c.v2, c.v3 );
	 break;
      case _ScaleH:
	 Scale( x + c.x, y + c.y, c.l, c.v2, c.v4, c.v3, 1, f );
	 break;
      case _ScaleV:
	 Scale( x + c.x, y + c.y, c.l, c.v2, c.v4, c.v3, 0, f );
	 break;
      case _Text:
	 TextD( x + c.x, y + c.y, c.d, f );
	 break;
      case _ToggleButton:
	 ToggleButton( x + c.x, y + c.y, c.d, c.v, f );
	 break;
      case _RadioButton:
	 RadioButton( x + c.x, y + c.y, c.d, c.v, f );
	 break;
      case _List:
	 i = c.v6 - c.v2;
	 i2 = c.v3 - c.v2;
	 ListD( x + c.x, y + c.y, c.l, i, i2, f );
      default:
	 return( 1 );
   }
   return( 0 );
}

int ListD( int x, int y, int l, int aa, int s, int f )
{
   SetPtrVis( HIDE );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x - 2, y - 2, x + 122, y + ( l * 11 ) + 2 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x - 2, y - 2, x + 122, y + ( l * 11 ) + 2 );

   _setcolor( 15 );
   _moveto( x + 121, y - 1 );
   _lineto( x + 121, y + ( l * 11 ) + 1 );
   _lineto( x - 1, y + ( l * 11 ) + 1 );

   _setcolor( 8 );
   _lineto( x - 1, y - 1 );
   _lineto( x + 121, y - 1 );

   if( f )
   {
      _setcolor( 0 );
      _rectangle( _GBORDER, x, y + ( aa * 11 ), x + 120, y + ( aa * 11 ) +
		  10 );
   }

   if( ( s >= 0 ) && ( s < l ) )
   {
      _setcolor( 8 );
      _rectangle( _GFILLINTERIOR, x, y + ( s * 11 ), x + 120,
		  y + ( s * 11 ) + 10 );
   }

   SetPtrVis( SHOW );
}

int HighlightMenu( struct WI w, int n )
{
   int i4, i2, x1, y1;

    if( ( w.stat == 3 ) || ( w.stat == 0 ) )
      return( 1 );

   if( w.stat == 2 )
      x1 = 0, y1 = 0;
   else
      x1 = w.x1, y1 = w.y1;

   i4 = 0;
   for( i2 = 0; i2 < n; i2 ++ )
      i4 += ( strlen( w.mu[i2] ) + 1 ) * 8;

   i2 = strlen( w.mu[n] ) * 8;

   SetPtrVis(HIDE);

   _setcolor( 15 );
   _moveto( i4 + 2 + x1, y1 + 26 );
   _lineto( i2 + 4 + i4 + x1, y1 + 26 );
   _lineto( i2 + 4 + i4 + x1, y1 + 15 );

   _setcolor( 8 );
   _lineto( i4 + 2 + x1, y1 + 15 );
   _lineto( i4 + 2 + x1, y1 + 26 );

   SetPtrVis( SHOW );

   return( 0 );
}

int i_act( struct WI *w,
	   struct component c[],
	   int n,
	   int m,
	   int *f,
	   int *kom
	 )
 {
   int i, i2;

   do
   {
      i2 = q_act( w, c, n, m, f, kom );
   }while( i2 == 0 );
   return( i2 );
}

int q_act( struct WI *w,
	   struct component c[],
	   int n,
	   int m,
	   int *f,
	   int *kom
	 )
{
   int i, i2, i3, i4, mc, mnu;
   int k, x1, y1, xc, yc;
   double sch, sch2;
   EVENT e;
   unsigned sh;

   mnu = -1;

   if( ( w->stat == 3 ) || ( w->stat == 0 ) )
      return( 1 );

   if( w->stat == 2 )
      x1 = 0, y1 = 0;
   else
      x1 = w->x1, y1 = w->y1;

   mc = 0;

   i2 = *f;
   if( c[i2].c == _Text )
   {
      i = Text( x1 + c[i2].x, y1 + c[i2].y, c[i2].d, i2, &c[i2].v,
	  c[i2].v6 );

      if( i == 2 )
      {
	 i = *f;

	 LocationCursor( *w, c[i], 0 );

	 i ++;

	 while( ( c[i].c == _ScrollBarH ) || ( c[i].c == _ScrollBarV ) )
	    i ++;

	 if( i >= n )
	    i = 0;

	 *f = i;

	 LocationCursor( *w, c[i], 1 );

	 return( 4 );
      }
      if( i == 3 )
      {
	 i = *f;

	 LocationCursor( *w, c[i], 0 );

	 i --;

	 while( ( c[i].c == _ScrollBarH ) || ( c[i].c == _ScrollBarV ) )
	 {
	    i --;
	 }

	 if( i < 0 )
	    i = n - 1;

	 *f = i;

	 LocationCursor( *w, c[i], 1 );

	 return( 4 );
      }
      if( i == 4 )
      {
	 for( i = 0; i < n; i ++ )
	 {
	    if( c[i].c == _PushButton )
	    {
	       if( c[i].v6 )
	       {
		  c[i].v = 1;
		  return( 3 );
	       }
	    }
	 }
      }
      if( i == 5 )
      {
	 mc = 2;
      }
   }

   /* Check for interaction */
   do
   {
      if( kbhit() )
      {
	 mc = 1;
	 break;
      }
      if( m )
      {
	 GetPtrPos( &e );
	 if( e.fsBtn )
	 {
	    mc = 2;
	    break;
	 }
      }
      return( 0 );
   }while( 0 );

   if( mc == 1 )
   {
   rst:
      if( mnu > -1 )
      {
	 i4 = 0;
	 for( i2 = 0; i2 < mnu; i2 ++ )
	    i4 += ( strlen( w->mu[i2] ) + 1 ) * 8;

	 i2 = strlen( w->mu[mnu] ) * 8;

	 SetPtrVis(HIDE);

	 _setcolor( 15 );
	 _moveto( i4 + 2 + x1, y1 + 26 );
	 _lineto( i2 + 4 + i4 + x1, y1 + 26 );
	 _lineto( i2 + 4 + i4 + x1, y1 + 15 );

	 _setcolor( 8 );
	 _lineto( i4 + 2 + x1, y1 + 15 );
	 _lineto( i4 + 2 + x1, y1 + 26 );

	 SetPtrVis( SHOW );
      }

      k = getch();
      if( ( k == 0 ) || ( k == 0xe0 ) )
      {
	 k = getch();
	 switch( k )
	 {
	    case 0x44:   /* F10 - activate menubar if available */
	       if( mnu > -1 )
	       {
		  return( 1 );
	       }

	       if( w->mb )
	       {
		  mnu = 0;
		  /* Restart keyboard work */
		  goto rst;
	       }

	       return( 0 );
	    case 0x48:   /* Up */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 --;
		  if( ( c[i].v6 < c[i].v2 ) && ( c[i].v6 >= 0 ) )
		  {
		     c[i].v2 = c[i].v6;
		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 > c[i].v )
		     c[i].v6 = c[i].v;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }

	       if( c[i].c == _ScaleV )
	       {
		  c[i].v2 += c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 0, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x50:   /* Down */
	       if( mnu > -1 )
	       {
		  i2 = mnu;
		  i2 += 1;
		  i2 = -i2;
		  *kom = 1;
		  return( i2 );
	       }

	       i = *f;

	       if( c[i].c == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 ++;
		  if( ( c[i].v6 >= c[i].v2 + c[i].l ) &&
		      ( c[i].v6 < c[i].v ) )
		  {
		     c[i].v2 = c[i].v6 - c[i].l + 1;
		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 >= c[i].v )
		     c[i].v6 = c[i].v - 1;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }

	       if( c[i].c == _ScaleV )
	       {
		  c[i].v2 -= c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 0, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x8d:   /* Ctrl+Up */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _ScaleV )
	       {
		  c[i].v2 += 10 * c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 0, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x91:   /* Ctrl+Down */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }
	       i = *f;

	       if( c[i].c == _ScaleV )
	       {
		  c[i].v2 -= 10 * c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 0, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x4d:   /* Right */
	       if( mnu > -1 )
	       {
		  i4 = 0;
		  i3 = 0;
		  for( i2 = 0; i2 < 10; i2 ++ )
		  {
		     if( i2 < mnu )
			i4 += ( strlen( w->mu[i2] ) + 1 ) * 8;
		     if( isalpha( w->mu[i2][0] ) )
			i3 ++;
		     else
			break;
		  }

		  i2 = strlen( w->mu[mnu] ) * 8;

		  SetPtrVis(HIDE);

		  _setcolor( 7 );
		  _moveto( i4 + 2 + x1, y1 + 26 );
		  _lineto( i2 + 4 + i4 + x1, y1 + 26 );
		  _lineto( i2 + 4 + i4 + x1, y1 + 15 );
		  _lineto( i4 + 2 + x1, y1 + 15 );
		  _lineto( i4 + 2 + x1, y1 + 26 );

		  SetPtrVis( SHOW );

		  mnu ++;

		  if( mnu >= i3 )
		     mnu = 0;

		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _ScaleH )
	       {
		  c[i].v2 += c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 1, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x4b:   /* Left */
	       if( mnu > -1 )
	       {
		  i4 = 0;
		  i3 = 0;
		  for( i2 = 0; i2 < 10; i2 ++ )
		  {
		     if( i2 < mnu )
			i4 += ( strlen( w->mu[i2] ) + 1 ) * 8;
		     if( isalpha( w->mu[i2][0] ) )
			i3 ++;
		     else
			break;
		  }

		  i2 = strlen( w->mu[mnu] ) * 8;

		  SetPtrVis(HIDE);

		  _setcolor( 7 );
		  _moveto( i4 + 2 + x1, y1 + 26 );
		  _lineto( i2 + 4 + i4 + x1, y1 + 26 );
		  _lineto( i2 + 4 + i4 + x1, y1 + 15 );
		  _lineto( i4 + 2 + x1, y1 + 15 );
		  _lineto( i4 + 2 + x1, y1 + 26 );

		  SetPtrVis( SHOW );

		  mnu --;

		  if( mnu < 0 )
		     mnu = i3 - 1;

		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _ScaleH )
	       {
		  c[i].v2 -= c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 1, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x74:   /* Ctrl+Right */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _ScaleH )
	       {
		  c[i].v2 += 10 * c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 1, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x73:   /* Ctrl+Left */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _ScaleH )
	       {
		  c[i].v2 -= 10 * c[i].v5;

		  if( c[i].v2 > c[i].v3 )
		     c[i].v2 = c[i].v3;

		  if( c[i].v2 < c[i].v4 )
		     c[i].v2 = c[i].v4;

		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, 1, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x47:   /* Home/Begin */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( ( c[i].c == _ScaleV ) || ( c[i].c == _ScaleH ) )
	       {
		  c[i].v2 = c[i].v4;

		  i2 = c[i].c == _ScaleH;
		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, i2, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x4f:   /* End */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( ( c[i].c == _ScaleV ) || ( c[i].c == _ScaleH ) )
	       {
		  c[i].v2 = c[i].v3;

		  i2 = c[i].c == _ScaleH;
		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, i2, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x77:   /* Ctrl+Home/Begin */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].v == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 = 0;

		  if( ( c[i].v6 < c[i].v2 ) && ( c[i].v6 >= 0 ) )
		  {
		     c[i].v2 = c[i].v6;
		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 > c[i].v )
		     c[i].v6 = c[i].v;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );

	       }

	       if( ( c[i].c == _ScaleV ) || ( c[i].c == _ScaleH ) )
	       {
		  c[i].v2 = c[i].v4;

		  i2 = c[i].c == _ScaleH;
		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, i2, 1 );
		  return( 4 );
	       }

	       return( 0 );

	    case 0x75:   /* Ctrl+End */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       if( c[i].c == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 = c[i].v - 1;
		  if( c[i].v6 >= c[i].v2 + c[i].l )
		  {
		     c[i].v2 = c[i].v6 - c[i].l + 1;
		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 > c[i].v )
		     c[i].v6 = c[i].v;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }

	       if( ( c[i].c == _ScaleV ) || ( c[i].c == _ScaleH ) )
	       {
		  c[i].v2 = c[i].v3;

		  i2 = c[i].c == _ScaleH;
		  _setcolor( w->mfc );
		  Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2, c[i].v4,
			 c[i].v3, i2, 1 );
		  return( 4 );
	       }

	       return( 0 );
	    case 0x49:  /* Page Up */
	       i = *f;

	       if( c[i].c == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 -= ( c[i].l - 1 );
		  if( c[i].v6 < c[i].v2 )
		  {
		     if( c[i].v6 < 0 )
			c[i].v6 = 0;

		     c[i].v2 = c[i].v6;
		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 > c[i].v )
		     c[i].v6 = c[i].v;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }

	       return( 0 );
	    case 0x51:  /* Page Down */
	       i = *f;

	       if( c[i].c == _List )
	       {
		  LocationCursor( *w, c[i], 0 );

		  c[i].v6 += ( c[i].l - 1 );
		  if( c[i].v6 >= c[i].v2 + c[i].l )
		  {
		     c[i].v2 = c[i].v6 - c[i].l + 1;

		     if( c[i].v2 + c[i].l >= c[i].v )
			c[i].v2 = c[i].v - c[i].l;

		     if( c[i].v6 >= c[i].v )
			c[i].v6 = c[i].v - 1;

		     LocationCursor( *w, c[i], 1 );
		     return( 5 );
		  }

		  if( c[i].v6 < 0 )
		     c[i].v6 = 0;

		  if( c[i].v6 >= c[i].v )
		     c[i].v6 = c[i].v - 1;

		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }

	       return( 0 );
	    case 0xf: /* Shift+Tab */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       LocationCursor( *w, c[i], 0 );

	       i --;

	       while( ( c[i].c == _ScrollBarH ) || ( c[i].c == _ScrollBarV ) )
	       {
		  i --;
	       }

	       if( i < 0 )
		  i = n - 1;

	       LocationCursor( *w, c[i], 1 );
	       *f = i;

	       return( 4 );

	    case 0x94:    /* Ctrl+Tab */
	       if( mnu > -1 )
	       {
		  goto rst;
	       }

	       i = *f;

	       LocationCursor( *w, c[i], 0 );

	       i ++;

	       while( ( c[i].c == _ScrollBarH ) || ( c[i].c == _ScrollBarV ) )
	       {
		  i ++;
	       }

	       if( i >= n )
		  i = 0;

	       *f = i;

	       LocationCursor( *w, c[i], 1 );
	       return( 4 );

	    case 0x6d: /* Cycle within window family */
	       return( 6 );

	    case 0xa5: /* Cycle to next window family */
	       return( 7 );

	    default:
	       return( 0 );
	 }
      }
      else
      {
	 switch( k )
	 {
	    case 0x1b: /* Escape */
	       if( mnu > -1 )
	       {
		  return( 1 );
	       }
	       return( 2 );

	    case '\t':  /* Tab */
	       if( n <= 0 )
		  return( 4 );

	       i = *f;

	       LocationCursor( *w, c[i], 0 );

	       i ++;

	       while( ( c[i].c == _ScrollBarH ) || ( c[i].c == _ScrollBarV ) )
		  i ++;

	       if( i >= n )
		  i = 0;

	       *f = i;

	       LocationCursor( *w, c[i], 1 );
	       return( 4 );
	    case '\r':
	       i = *f;
	       if( c[i].c == _PushButton )
	       {
		  c[i].v = 1;
		  if( c[i].v6 )
		     return( 1 );
	       }
	       else
	       {
		  for( i = 0; i < n; i ++ )
		  {
		     if( c[i].c == _PushButton )
		     {
			if( c[i].v6 )
			{
			   c[i].v = 1;
			   return( 3 );
			}
		     }
		  }
	       }

	       return( 1 );
	    case ' ':
	       sh = _bios_keybrd( _NKEYBRD_SHIFTSTATUS );
	       if( ( sh == 0x228 ) || ( sh == 0x2a8 ) )
	       {
		  /* Window Menu */
		  SetPtrVis(HIDE);
		  _setcolor( 8 );
		  _moveto( x1 + 1, y1 + 12 );
		  _lineto( x1 + 1, y1 + 1 );
		  _lineto( x1 + 11, y1 + 1 );
		  _setcolor( 15 );
		  _moveto( x1 + 11, y1 + 1 );
		  _lineto( x1 + 11, y1 + 12 );
		  _lineto( x1 + 1, y1 + 12 );

		  i = WindowMenu( w, 1 );

		  return( 1 );
	       }

	       i = *f;
	       if( c[i].c == _PushButton )
	       {
		  c[i].v = 1;

		  /* Make button push in. . . */
		  PushButton( x1 + c[i].x, y1 + c[i].y, c[i].d, 1, c[i].v6, 1 );

		  /* Wait. . . */
		  for( i3 = 0; i3 < 10; i3 ++ )
		     for( i2 = 0; i2 < 10000; i2 ++ )
			;

		  /* Make button push out. . . */
		  PushButton( x1 + c[i].x, y1 + c[i].y, c[i].d, 0, c[i].v6, 1 );

		  return( 4 );
	       }
	       if( c[i].c == _OptionButton )
	       {
		  c[i].v = 1;
		  OptionButton( x1 + c[i].x, y1 + c[i].y, c[i].d, 1, 1 );
		  return( 4 );
	       }
	       if( c[i].c == _List )
	       {
		  c[i].v3 = c[i].v6;
		  return( 5 );
	       }
	       if( c[i].c == _ToggleButton )
	       {
		  c[i].v = !c[i].v;

		  ToggleButton( c[i].x + x1, c[i].y + y1, c[i].d, c[i].v, 1 );
		  return( 4 );
	       }
	       if( c[i].c == _RadioButton )
	       {
		  i2 = 0;
		  for( i3 = 0; i3 < n; i3 ++ )
		  {
		     if( i3 == i )
			continue;

		     if( c[i3].c != _RadioButton )
			continue;

		     if( c[i3].l == c[i].l )
		     {
			c[i3].v = 0;
			RadioButton( c[i3].x + x1, c[i3].y + y1, c[i3].d, 0, 0 );
			i2 = 1;
		     }
		  }

		  if( i2 )
		     c[i].v = 1;
		  else
		     c[i].v = !c[i].v;

		  RadioButton( c[i].x + x1, c[i].y + y1, c[i].d, c[i].v, 1 );

		  return( 4 );
	       }
	       return( 0 );
	    default:
	       break;
	 }
      }
   }

   if( mc == 2 )
   {
      if( !m )
	 return( 0 );

      *kom = 0;

      /* Mouse Working */
      for( i = 0; i < n; i ++ )
      {
	 switch( c[i].c )
	 {
	    case _PushButton:
	       i2 = u_btn( c[i].x + x1, c[i].y + y1, c[i].d );
	       if( i2 )
	       {
		  c[i].v = 1;
		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }
	       break;
	    case _OptionButton:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       if( if_btn( c[i].x + x1, c[i].y + y1, xc, yc ) )
	       {
		  if( e.fsBtn != 1 )
		  {
		     return( 4 );
		  }

		  OptionButton( c[i].x + x1, c[i].y + y1, c[i].d, 1, 1 );
		  c[i].v = 1;

		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }
	       break;
	    case _Text:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       if( if_btn( c[i].x + x1, c[i].y + y1, xc, yc ) )
	       {

		  if( e.fsBtn != 1 )
		  {
		     return( 4 );
		  }

		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );
		  return( 4 );
	       }
	       break;
	    case _RadioButton:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       i2 = strlen( c[i].d ) * 8;
	       if( ( e.x > x1 + c[i].x - 2 ) && ( e.y > y1 + c[i].y - 2 ) &&
		   ( e.x < x1 + c[i].x + i2 + 17 ) &&
		   ( e.y < y1 + c[i].y + 12 ) )
	       {
		  if( e.fsBtn != 1 )
		  {
		     return( 4 );
		  }

		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );

		  i2 = 0;
		  for( i3 = 0; i3 < n; i3 ++ )
		  {
		     if( i3 == i )
			continue;

		     if( c[i3].c != _RadioButton )
			continue;

		     if( c[i3].l == c[i].l )
		     {
			c[i3].v = 0;
			RadioButton( c[i3].x + x1, c[i3].y + y1, c[i3].d, 0, 0 );
			i2 = 1;
		     }
		  }

		  if( i2 )
		     c[i].v = 1;
		  else
		     c[i].v = !c[i].v;

		  RadioButton( c[i].x + x1, c[i].y + y1, c[i].d, c[i].v, 1 );

		  return( 4 );
	       }
	       break;
	    case _ToggleButton:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       i2 = strlen( c[i].d ) * 8;
	       if( ( e.x > x1 + c[i].x - 2 ) && ( e.y > y1 + c[i].y - 2 ) &&
		   ( e.x < x1 + c[i].x + i2 + 17 ) &&
		   ( e.y < y1 + c[i].y + 12 ) )
	       {
		  if( e.fsBtn != 1 )
		  {
		     return( 4 );
		  }

		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );

		  c[i].v = !c[i].v;

		  ToggleButton( c[i].x + x1, c[i].y + y1, c[i].d, c[i].v, 1 );

		  wait_for_release();
		  return( 4 );
	       }
	       break;
	    case _ScrollBarH:
	       i2 = RunScrollBar( c[i].x + x1, c[i].y + y1, c[i].l, &c[i].v2,
			     c[i].v3, 1, c[i].v5, c[i].v6 );
	       if( i2 )
		  break;
	       return( 4 );
	    case _ScrollBarV:
	       i2 = RunScrollBar( c[i].x + x1, c[i].y + y1, c[i].l, &c[i].v2,
			     c[i].v3, 0, c[i].v5, c[i].v6 );
	       if( i2 )
		  break;
	       return( 4 );
	    case _List:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;

	       if( ( xc > c[i].x + x1 ) && ( xc < c[i].x + x1 + 100 ) &&
		   ( yc > c[i].y + y1 ) && ( yc < c[i].y + y1 + ( c[i].l * 11 ) ) )

	       {
		  *f = i;

		  for( i2 = 0; i2 < c[i].l; i2 ++ )
		  {
		     if( ( yc > c[i].y + y1 + ( i2 * 11 ) ) &&
			 ( yc < c[i].y + y1 + ( i2 + 1 ) * 11 ) )
		     {
			LocationCursor( *w, c[i], 0 );
			c[i].v6 = c[i].v2 + i2;
			LocationCursor( *w, c[i], 1 );

			c[i].v3 = c[i].v6;

			wait_for_release();

			for( i3 = 0; i3 < 5000; i3 ++ )
			{
			   GetPtrPos( &e );

			   xc = e.x, yc = e.y;
			   if( e.fsBtn )
			   {
			      /* double click occured */
			      return( 3 );
			   }
			}

			return( 5 );
		     }
		  }
		  return( 4 );
	       }

	       break;
	    case _ScaleH:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       i2 = strlen( c[i].d ) * 8;

	       if( ( xc > x1 + c[i].x - 2 ) && ( yc > y1 + c[i].y ) &&
		   ( xc < x1 + c[i].x + c[i].l + 12 ) &&
		      ( yc < y1 + c[i].y + 9 ) )
	       {
		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );

		  sch = c[i].v3 - c[i].v4;
		  sch2 = c[i].v2 - c[i].v4;

		  sch = sch2 / sch;
		  sch *= c[i].l;
		  i2 = sch;

		  if( e.fsBtn == 3 )
		  {
		     i3 = xc + 2;
		     while( 1 )
		     {
			e.fsBtn = 0;
			GetPtrPos( &e );

			if( e.x == i3 )
			   continue;

			if( !e.fsBtn )
			   break;

			i3 = e.x;
			xc = i3;

			sch = - ( xc - x1 - c[i].x - c[i].l - 5 );
			c[i].v2 = ( ( sch * ( c[i].v4 - c[i].v3 ) ) /
				     c[i].l ) + c[i].v3;

			if( c[i].v2 < c[i].v4 )
			{
			   c[i].v2 = c[i].v4;
			}
			if( c[i].v2 > c[i].v3 )
			{
			   c[i].v2 = c[i].v3;
			}

			SetPtrVis( HIDE );
			Scale( x1 + c[i].x, y1 + c[i].y, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 1, 1 );
			SetPtrVis( SHOW );
		     }
		     return( 4 );
		  }

		  if( e.fsBtn == 1 )
		  {
		     if( ( xc > ( x1 + c[i].x + i2 ) ) &&
			 ( xc < ( x1 + c[i].x + i2 + 10 ) ) )
		     {
			i3 = xc + 2;
			while( 1 )
			{
			   e.fsBtn = 0;
			   GetPtrPos( &e );

			   if( e.x == i3 )
			      continue;

			   if( !e.fsBtn )
			      break;

			   i3 = e.x;
			   xc = i3;

			   sch = - ( xc - x1 - c[i].x - c[i].l - 5 );
			   c[i].v2 = ( ( sch * ( c[i].v4 - c[i].v3 ) ) /
					c[i].l ) + c[i].v3;

			   if( c[i].v2 < c[i].v4 )
			   {
			      c[i].v2 = c[i].v4;
			   }
			   if( c[i].v2 > c[i].v3 )
			   {
			      c[i].v2 = c[i].v3;
			   }

			   SetPtrVis( HIDE );
			   Scale( x1 + c[i].x, y1 + c[i].y, c[i].l, c[i].v2,
				  c[i].v4, c[i].v3, 1, 1 );
			   SetPtrVis( SHOW );
			}
			return( 4 );
		     }

		     if( xc < ( x1 + c[i].x + i2 ) )
		     {
			c[i].v2 -= 10 * c[i].v5;

			if( c[i].v2 > c[i].v3 )
			   c[i].v2 = c[i].v3;

			if( c[i].v2 < c[i].v4 )
			   c[i].v2 = c[i].v4;

			SetPtrVis( HIDE );
			Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 1, 1 );
			SetPtrVis( SHOW );
			for( i = 0; i < 10000; i ++ )
			   for( i2 = 0; i2 < 10; i2 ++ )
			      ;

			return( 4 );
		     }
		     if( xc > ( x1 + c[i].x + i2 + 10 ) )
		     {
			c[i].v2 += 10 * c[i].v5;

			if( c[i].v2 > c[i].v3 )
			   c[i].v2 = c[i].v3;

			if( c[i].v2 < c[i].v4 )
			   c[i].v2 = c[i].v4;

			SetPtrVis( HIDE );
			Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 1, 1 );
			SetPtrVis( SHOW );

			for( i = 0; i < 10000; i ++ )
			   for( i2 = 0; i2 < 10; i2 ++ )
			      ;
			return( 4 );
		     }
		  }
		  return( 4 );
	       }
	       break;
	    case _ScaleV:
	       GetPtrPos( &e );

	       xc = e.x, yc = e.y;
	       i2 = strlen( c[i].d ) * 8;

	       if( ( yc > y1 + c[i].y - 2 ) && ( xc > x1 + c[i].x ) &&
		   ( yc < y1 + c[i].y + c[i].l + 12 ) &&
		      ( xc < x1 + c[i].x + 9 ) )
	       {
		  i2 = *f;
		  LocationCursor( *w, c[i2], 0 );
		  *f = i;
		  LocationCursor( *w, c[i], 1 );

		  sch = c[i].v4 - c[i].v3;
		  sch2 = c[i].v2 - c[i].v3;

		  sch = sch2 / sch;
		  sch *= c[i].l;
		  i2 = sch;

		  if( e.fsBtn == 3 )
		  {
		     i3 = yc + 2;
		     while( 1 )
		     {
			e.fsBtn = 0;
			GetPtrPos( &e );

			if( e.y == i3 )
			   continue;

			if( !e.fsBtn )
			   break;

			i3 = e.y;
			yc = i3;

			sch = ( yc - y1 - c[i].y - 5 );
			c[i].v2 = ( ( sch * ( c[i].v4 - c[i].v3 ) ) /
				     c[i].l ) + c[i].v3;

			if( c[i].v2 < c[i].v4 )
			{
			   c[i].v2 = c[i].v4;
			}
			if( c[i].v2 > c[i].v3 )
			{
			   c[i].v2 = c[i].v3;
			}

			SetPtrVis( HIDE );
			Scale( x1 + c[i].x, y1 + c[i].y, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 0, 1 );
			SetPtrVis( SHOW );
		     }
		     return( 4 );
		  }

		  if( e.fsBtn == 1 )
		  {
		     if( ( yc > ( y1 + c[i].y + i2 ) ) &&
			 ( yc < ( y1 + c[i].y + i2 + 10 ) ) )
		     {
			i3 = yc + 2;
			while( 1 )
			{
			   e.fsBtn = 0;
			   GetPtrPos( &e );

			   if( e.y == i3 )
			      continue;

			   if( !e.fsBtn )
			      break;

			   i3 = e.y;
			   yc = i3;

			   sch = ( yc - y1 - c[i].y - 5 );
			   c[i].v2 = ( ( sch * ( c[i].v4 - c[i].v3 ) ) /
					c[i].l ) + c[i].v3;

			   if( c[i].v2 < c[i].v4 )
			   {
			      c[i].v2 = c[i].v4;
			   }
			   if( c[i].v2 > c[i].v3 )
			   {
			      c[i].v2 = c[i].v3;
			   }

			   SetPtrVis( HIDE );
			   Scale( x1 + c[i].x, y1 + c[i].y, c[i].l, c[i].v2,
				  c[i].v4, c[i].v3, 0, 1 );
			   SetPtrVis( SHOW );
			}
			return( 4 );
		     }

		     if( yc < ( y1 + c[i].y + i2 ) )
		     {
			c[i].v2 += 10 * c[i].v5;

			if( c[i].v2 > c[i].v3 )
			   c[i].v2 = c[i].v3;

			if( c[i].v2 < c[i].v4 )
			   c[i].v2 = c[i].v4;

			SetPtrVis( HIDE );
			Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 0, 1 );
			SetPtrVis( SHOW );
			for( i = 0; i < 10000; i ++ )
			   for( i2 = 0; i2 < 10; i2 ++ )
			      ;

			return( 4 );
		     }
		     if( yc > ( y1 + c[i].y + i2 + 10 ) )
		     {
			c[i].v2 -= 10 * c[i].v5;

			if( c[i].v2 > c[i].v3 )
			   c[i].v2 = c[i].v3;

			if( c[i].v2 < c[i].v4 )
			   c[i].v2 = c[i].v4;

			SetPtrVis( HIDE );
			Scale( c[i].x + x1, c[i].y + y1, c[i].l, c[i].v2,
			       c[i].v4, c[i].v3, 0, 1 );
			SetPtrVis( SHOW );
			for( i = 0; i < 10000; i ++ )
			   for( i2 = 0; i2 < 10; i2 ++ )
			      ;

			return( 4 );
		     }
		  }
		  return( 4 );
	       }
	       break;
	 }
      }

      i = Mouse( w );
      if( i > 0 )
      {
	 i = -i;
	 return( i );
      }

      switch( i )
      {
	 case 0:
	    i = 1;
	    break;
	 case -1:
	    i = 0;
	    break;
      }
      return( i );
   }

   return( 0 );
}

int RunScrollBar( int x, int y,
		  int l,
		  double *p,
		  double fra,
		  int hl,
		  double small,
		  int large
		)
{
   EVENT e;
   int v1, v2, i, i2;
   double sch;

   /* Determine slider length */
   sch = l * fra;
   v1 = sch;
   v1 /= 2;

   /* Determine slider position */
   sch = ( l - 2 * v1 ) * *p;
   v2 = sch;
   v2 += v1;

   GetPtrPos( &e );

   if( hl )
   {
      /* Horizontal */
      if( !( ( e.x > x ) && ( e.y > y ) && ( e.x < x + l + 30 ) &&
	     ( e.y < y + 10 ) ) )
	 return( 1 );

      if( e.x < x + 15 )
      {
	 /* Left arrow */
	 _setcolor( 8 );
	 _moveto( x + 1, y + 5 );
	 _lineto( x + 14, y + 1 );
	 _setcolor( 15 );
	 _lineto( x + 14, y + 9 );
	 _lineto( x + 1, y + 5 );

	 *p -= small;
	 if( *p < 0 )
	    *p = 0;

	 sbarh( x, y, l, *p, fra );

	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;
	 return( 0 );
      }
      if( e.x > x + l + 15 )
      {
	 /* Right arrow */
	 _setcolor( 8 );
	 _moveto( x + l + 29, y + 5 );
	 _lineto( x + l + 16 , y + 1 );
	 _lineto( x + l + 16, y + 9 );
	 _setcolor( 15 );
	 _lineto( x + l + 29, y + 5 );

	 *p += small;
	 if( *p > 1 )
	    *p = 1;

	 sbarh( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
      if( ( e.x > x + v2 - v1 + 15 ) && ( e.x < x + v2 + v1 + 15 ) )
      {
	 i = e.x + 1;
	 while( 1 )
	 {
	    GetPtrPos( &e );

	    if( !e.fsBtn )
	       break;

	    sch = ( e.x - ( x + 15. ) ) / l;

	    if( sch > 1 )
	       sch = 1;

	    if( sch < 0 )
	       sch = 0;

	    *p = sch;

	    if( e.x == i )
	       continue;

	     i = e.x;

	    sbarh( x, y, l, *p, fra );
	 }
	 return( 0 );
      }

      if( e.x < v2 + x + 15 )
      {
	 /* Left trough */
	 *p -= large * small;
	 if( *p < 0 )
	    *p = 0;

	 sbarh( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
      if( e.x > v2 + x + 15 )
      {
	 /* Right trough */
	 *p += large * small;
	 if( *p > 1 )
	    *p = 1;

	 sbarh( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
   }
   else
   {
      /* Vertical */
      if( !( ( e.x > x ) && ( e.y > y ) && ( e.y < y + l + 30 ) &&
	     ( e.x < x + 10 ) ) )
	 return( 1 );

      if( e.y < y + 15 )
      {
	 /* Upper arrow */
	 _setcolor( 8 );
	 _moveto( x + 5, y + 1 );
	 _lineto( x + 1, y + 14 );
	 _setcolor( 15 );
	 _lineto( x + 9, y + 14 );
	 _lineto( x + 5, y + 1 );

	 *p -= small;
	 if( *p < 0 )
	    *p = 0;

	 sbarv( x, y, l, *p, fra );

	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;
	 return( 0 );
      }
      if( e.y > y + l + 15 )
      {
	 /* Lower arrow */
	 _setcolor( 8 );
	 _moveto( x + 5, y + l + 29 );
	 _lineto( x + 1, y + l + 16 );
	 _lineto( x + 9, y + l + 16 );
	 _setcolor( 15 );
	 _lineto( x + 5, y + l + 29 );

	 *p += small;
	 if( *p > 1 )
	    *p = 1;

	 sbarv( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
      if( ( e.y > y + v2 - v1 + 15 ) && ( e.y < y + v2 + v1 + 15 ) )
      {
	 i = e.y + 1;
	 while( 1 )
	 {
	    GetPtrPos( &e );

	    if( !e.fsBtn )
	       break;

	    sch = ( e.y - ( y + 15. ) ) / l;

	    if( sch > 1 )
	       sch = 1;

	    if( sch < 0 )
	       sch = 0;

	    *p = sch;

	    if( e.y == i )
	       continue;

	    i = e.y;

	    sbarv( x, y, l, *p, fra );
	 }
	 return( 0 );
      }

      if( e.y < v2 + y + 15 )
      {
	 /* Upper trough */
	 *p -= large * small;
	 if( *p < 0 )
	    *p = 0;

	 sbarv( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
      if( e.y > v2 + y + 15 )
      {
	 /* Lower trough */
	 *p += large * small;
	 if( *p > 1 )
	    *p = 1;

	 sbarv( x, y, l, *p, fra );
	 for( i = 0; i < 10000; i ++ )
	    for( i2 = 0; i2 < 10; i2 ++ )
	       ;

	 return( 0 );
      }
   }
}

int sbarh( int x, int y, int l, double p, double fra )
{
   int v1, v2;
   double sch;

   /* Determine slider length */
   sch = l * fra;
   v1 = sch;
   v1 /= 2;

   /* Determine slider position */
   sch = ( l - 2 * v1 ) * p;
   v2 = sch;
   v2 += v1;

   SetPtrVis( HIDE );
   /* Clear out slider area */
   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x + 15, y, x + l + 15, y + 10 );

   _setcolor( 15 );
   _moveto( x + l + 31, y - 1 );
   _lineto( x + l + 31, y + 11 );
   _lineto( x - 1, y + 11 );

   _setcolor( 8 );
   _lineto( x - 1, y - 1 );
   _lineto( x + l + 31, y - 1 );

   /* Left Arrow */
   _setcolor( 0 );
   _moveto( x, y + 5 );
   _lineto( x + 15, y );
   _lineto( x + 15, y + 10 );
   _lineto( x, y + 5 );
   _setcolor( 7 );
   _moveto( x, y + 5 );
   _lineto( x + 15, y );
   _lineto( x + 15, y + 10 );
   _lineto( x, y + 5 );
   _floodfill( x + 14, y + 5, 7 );
   _setcolor( 0 );
   _moveto( x, y + 5 );
   _lineto( x + 15, y );
   _lineto( x + 15, y + 10 );
   _lineto( x, y + 5 );
   _setcolor( 15 );
   _moveto( x + 1, y + 5 );
   _lineto( x + 14, y + 1 );
   _setcolor( 8 );
   _lineto( x + 14, y + 9 );
   _lineto( x + 1, y + 5 );

   /* slider */
   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x + v2 - v1 + 15, y, x + v2 + v1 + 15, y + 10 );
   _setcolor( 0 );
   _rectangle( _GBORDER, x + v2 - v1 + 15, y, x + v2 + v1 + 15, y + 10 );

   _setcolor( 15 );
   _moveto( x + v2 - v1 + 1 + 15, y + 9 );
   _lineto( x + v2 - v1 + 1 + 15, y + 1 );
   _lineto( x + v2 + v1 - 1 + 15, y + 1 );

   _setcolor( 8 );
   _lineto( x + v2 + v1 - 1 + 15, y + 9 );
   _lineto( x + v2 - v1 + 1 + 15, y + 9 );

   /* Right Arrow */
   _setcolor( 0 );
   _moveto( x + l + 30, y + 5 );
   _lineto( x + l + 15, y );
   _lineto( x + l + 15, y + 10 );
   _lineto( x + l + 30, y + 5 );
   _setcolor( 7 );
   _moveto( x + l + 30, y + 5 );
   _lineto( x + l + 15, y );
   _lineto( x + l + 15, y + 10 );
   _lineto( x + l + 30, y + 5 );
   _floodfill( x + l + 16, y + 5, 7 );
   _setcolor( 0 );
   _moveto( x + l + 30, y + 5 );
   _lineto( x + l + 15, y );
   _lineto( x + l + 15, y + 10 );
   _lineto( x + l + 30, y + 5 );
   _setcolor( 15 );
   _moveto( x + l + 29, y + 5 );
   _lineto( x + l + 16 , y + 1 );
   _lineto( x + l + 16, y + 9 );
   _setcolor( 8 );
   _lineto( x + l + 29, y + 5 );

   SetPtrVis( SHOW );
}

int OptionButton( int x, int y, char *txt, int st, int f )
{
   int str;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);

   /* Draw box */
   _setcliprgn( x, y, x + 100, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x+100, y+15 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+100, y+15 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+99, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 8 );
      _moveto( x+1, y+14 );
      _lineto( x+99, y+14 );
      _lineto( x+99, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+99, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );
   }
   _setcliprgn( x+2, y+2, x+98, y+13 );

   _setcolor( 0 );
   str = strlen( txt );
   str = str / 2;
   str *= 8;
   str = 50 - str;
   _moveto( x + str, y + 2 );
   _outgtext( txt );

   _setcolor( 15 );
   _moveto( x+84, y + 10 );
   _lineto( x+84, y + 5 );
   _lineto( x+94, y + 5 );

   _setcolor( 8 );
   _moveto( x + 94, y + 5 );
   _lineto( x + 94, y + 10 );
   _lineto( x + 84, y + 10 );

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   /* Focus cursor */
   if( f )
   {
      _setcolor( 0 );
      _rectangle( _GBORDER, x - 2, y - 2, x + 102, y + 17 );
   }

   SetPtrVis(SHOW);
}

int PushButton( int x, int y, char *txt, int st, int b, int f )
{
   int str;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);

   /* Draw box */
   _setcliprgn( x, y, x + 100, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x+100, y+15 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+100, y+15 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+99, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 8 );
      _moveto( x+1, y+14 );
      _lineto( x+99, y+14 );
      _lineto( x+99, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+99, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );
   }
   _setcliprgn( x+2, y+2, x+98, y+13 );

   _setcolor( 0 );
   str = strlen( txt );
   str = str / 2;
   str *= 8;
   str = 50 - str;
   _moveto( x + str, y + 2 );
   _outgtext( txt );

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   if( b )
   {
      _setcolor( 0 );
      _rectangle( _GBORDER, x-5, y-5, x+105, y+20 );

      _setcolor( 8 );
      _moveto( x-4, y+19 );
      _lineto( x-4, y-4 );
      _lineto( x+104, y-4 );

      _setcolor( 15 );
      _moveto( x+104, y-4 );
      _lineto( x+104, y+19 );
      _lineto( x-4, y+19 );
   }

   /* Focus cursor */
   if( f )
   {
      _setcolor( 0 );
      _rectangle( _GBORDER, x - 7, y - 7, x + 107, y + 22 );
   }

   SetPtrVis(SHOW);
}

int lbtn( int x, int y, char *txt, int st )
{
   int str;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);

   /* Draw box */
   _setcliprgn( x, y, x + 200, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x+200, y+15 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+200, y+15 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 8 );
      _moveto( x+1, y+14 );
      _lineto( x+199, y+14 );
      _lineto( x+199, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );
   }
   _setcliprgn( x+2, y+2, x+198, y+13 );

   _setcolor( 0 );
   str = strlen( txt );
   str = str / 2;
   str *= 8;
   str = 100 - str;
   _moveto( x + str, y + 2 );
   _outgtext( txt );

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   SetPtrVis(SHOW);
}

int lbtnl( int x, int y, char *txt, int st )
{
   int str;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);

   /* Draw box */
   _setcliprgn( x, y, x + 200, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x+200, y+15 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+200, y+15 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 8 );
      _moveto( x+1, y+14 );
      _lineto( x+199, y+14 );
      _lineto( x+199, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 15 );
      _moveto( x+1, y+14 );
      _lineto( x+199, y+14 );
      _lineto( x+199, y+1 );

   }
   _setcliprgn( x+2, y+2, x+198, y+13 );

   _setcolor( 0 );
   _moveto( x + 5, y + 2 );
   _outgtext( txt );

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   SetPtrVis(SHOW);
}

int CascadeButton( int x, int y, char *txt, int st )
{
   int str;
   struct videoconfig vc;

   _getvideoconfig( &vc );
   SetPtrVis(HIDE);

   /* Draw box */
   _setcliprgn( x, y, x + 200, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x+200, y+15 );

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+200, y+15 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 8 );
      _moveto( x+1, y+14 );
      _lineto( x+199, y+14 );
      _lineto( x+199, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+199, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+14 );

      _setcolor( 15 );
      _moveto( x+1, y+14 );
      _lineto( x+199, y+14 );
      _lineto( x+199, y+1 );

   }
   _setcliprgn( x+2, y+2, x+198, y+13 );

   _setcolor( 0 );
   _moveto( x + 5, y + 2 );
   _outgtext( txt );

   _setcliprgn( 0, 0, vc.numxpixels, vc.numypixels );

   _setcolor( 15 );
   _moveto( x + 184, y + 13 );
   _lineto( x + 184, y + 5 );
   _lineto( x + 194, y + 10 );

   _setcolor( 8 );
   _lineto( x + 184, y + 13 );

   SetPtrVis(SHOW);
}

int TextD( int x, int y, char *st, int f )
{
   struct videoconfig vc;

   _getvideoconfig( &vc );

   /* Clear Box */
   SetPtrVis(HIDE);
   _setcliprgn( x, y, x + 100, y + 15 );
   _clearscreen(_GVIEWPORT);
   _setcliprgn( 0, 0, vc.numxpixels, vc. numypixels );
   _setcolor( 7 );
   _rectangle( _GFILLINTERIOR, x, y, x + 100, y + 15 );
   _setcolor( 0 );
   _rectangle( _GBORDER, x-2, y-2, x + 102, y + 17 );
   _setcolor( 8 );
   _moveto( x-1, y + 16 );
   _lineto( x-1, y - 1 );
   _lineto( x+101, y - 1 );
   _setcolor( 15 );
   _moveto( x + 101, y - 1 );
   _lineto( x + 101, y + 16 );
   _lineto( x - 1, y + 16 );

   _setcolor( 0 );
   _moveto( x+1,y );

   _setcliprgn( x, y, x + 100, y + 15 );
   _outgtext( st );
   _setcliprgn( 0, 0, vc.numxpixels, vc. numypixels );

   if( f )
   {
      _setcolor( 0 );
      _rectangle( _GBORDER, x - 4, y - 4, x + 104, y + 19 );
   }

   SetPtrVis(SHOW);
}

int Text( int x, int y, char *st, int f, int *c, int m )
{
   EVENT e;
   int i, i2, i3, s, sh, mc;
   char k, k2[2], k3[13];
   struct videoconfig vc;

   _getvideoconfig( &vc );

   k = '\0';
   k2[0] = '\0';
   k2[1] = '\0';
   k3[12] = 0;
   s = 3;

   sh = 12;
   i = *c;

   if( i > sh )
      sh = i;

   i3 = 0;
   for( i2 = sh - 12; i2 < sh; i2 ++ )
   {
      k3[i3] = st[i2];

      i3 ++;
   }
   k3[12] = '\0';
   TextD( x, y, k3, f );

   _setcolor( 0 );
   _moveto( x+3,y );

   while( k != '\r' )
   {
      i2 = ( i - sh ) + 12;
      SetPtrVis(HIDE);
      _setcolor( 0 );
      _moveto( x + s + (i2 * 8) - 2, y + 14 );
      _lineto( x + s + (i2 * 8), y + 10 );
      _lineto( x + s + (i2 * 8) + 2, y + 14 );
      _lineto( x + s + (i2 * 8) - 2, y + 14 );
      _floodfill( x + s + (i2 * 8), y + 12, 0 );
      SetPtrVis(SHOW);

      mc = 0;

      while( 1 )
      {
	 if( kbhit() )
	 {
	    k = getch();
	    mc = 0;
	    break;
	 }
	 if( m )
	 {
	    e.fsBtn = 0;
	    GetPtrPos( &e );
	    if( e.fsBtn )
	    {
	       if( if_btn( x, y, e.x, e.y ) )
	       {
		  SetPtrVis(HIDE);
		  _setcolor( 7 );
		  i2 = ( i - sh ) + 12;
		  _moveto( x + s + (i2 * 8) - 2, y + 14 );
		  _lineto( x + s + (i2 * 8), y + 10 );
		  _lineto( x + s + (i2 * 8) + 2, y + 14 );
		  _lineto( x + s + (i2 * 8) - 2, y + 14 );
		  _floodfill( x + s + (i2 * 8), y + 12, 7 );
		  SetPtrVis(SHOW);

		  i3 = strlen( st );
		  if( i3 == 0 )
		  {
		     mc = 2;
		     break;
		  }

		  e.x = e.x - x;
		  i2 = e.x / 8;

		  if( sh <= 12 )
		  {
		     if( i2 <= i3 )
		     {
			i = i2;
			mc = 2;
			break;
		     }
		     else
		     {
			i = i3;
			mc = 2;
			break;
		     }
		  }

		  if( i3 <= ( sh - 12 ) + i2 )
		  {
		     i = i3;
		     mc = 2;
		     break;
		  }

		  i = ( sh - 12 ) + i2;
		  mc = 2;
		  break;
	       }
	       else
	       {
		  mc = 1;
		  break;
	       }
	    }
	 }
      }

      if( mc == 2 )
      {
	 continue;
      }

      if( mc == 1 )
      {
	 i2 = strlen( st );
	 st[i2] = '\0';
	 *c = i;

	 SetPtrVis(HIDE);
	 _setcolor( 7 );
	 i2 = ( i - sh ) + 12;
	 _moveto( x + s + (i2 * 8) - 2, y + 14 );
	 _lineto( x + s + (i2 * 8), y + 10 );
	 _lineto( x + s + (i2 * 8) + 2, y + 14 );
	 _lineto( x + s + (i2 * 8) - 2, y + 14 );
	 _floodfill( x + s + (i2 * 8), y + 12, 7 );
	 SetPtrVis(SHOW);

	 return( 5 );
      }

      if( ( k == 0 ) || ( k == 0xe0 ) )
      {
	 k = getch();
	 switch( k )
	 {
	    case 0xf: /* Shift+Tab */
	       i2 = strlen( st );
	       st[i2] = '\0';
	       *c = i;

	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       i2 = ( i - sh ) + 12;
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );
	       SetPtrVis(SHOW);

	       return( 3 );
	    case 0x4d:   /* Right */
	       i2 = ( i - sh ) + 12;
	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );

	       _moveto( x + s + (i2 * 8), y );
	       _setcolor( 0 );

	       SetPtrVis(SHOW);

	       i ++;

	       if( i >= m )
		  i = m;

	       if( i > sh )
	       {
		  sh = i;

		  i3 = 0;
		  for( i2 = sh - 12; i2 < sh; i2 ++ )
		  {
		     k3[i3] = st[i2];

		     i3 ++;
		  }
		  k3[12] = '\0';
		  TextD( x, y, k3, f );
	       }

	       break;
	    case 0x47:   /* Home */
	       i2 = ( i - sh ) + 12;
	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );

	       _moveto( x + s + (i2 * 8), y );
	       _setcolor( 0 );

	       SetPtrVis(SHOW);

	       i = 0;

	       if( i < ( sh - 12 ) )
	       {
		  sh = i + 12;

		  i3 = 0;
		  for( i2 = sh - 12; i2 < sh; i2 ++ )
		  {
		     k3[i3] = st[i2];

		     i3 ++;
		  }
		  k3[12] = '\0';
		  TextD( x, y, k3, f );
	       }

	       break;
	    case 0x4f:   /* End */
	       i2 = ( i - sh ) + 12;
	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );

	       _moveto( x + s + (i2 * 8), y );
	       _setcolor( 0 );

	       SetPtrVis(SHOW);

	       i = strlen( st );

	       if( i > sh )
	       {
		  sh = i;

		  i3 = 0;
		  for( i2 = sh - 12; i2 < sh; i2 ++ )
		  {
		     k3[i3] = st[i2];

		     i3 ++;
		  }
		  k3[12] = '\0';
		  TextD( x, y, k3, f );
	       }

	       break;
	    case 0x53:   /* Delete */
	       del_ch( st, m, i );

	       i3 = 0;
	       for( i2 = sh - 12; i2 < sh; i2 ++ )
	       {
		  k3[i3] = st[i2];

		  i3 ++;
	       }
	       k3[12] = '\0';

	       TextD( x, y, k3, f );

	       break;
	    case 0x4b:   /* Left */
	       i2 = ( i - sh ) + 12;
	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );

	       _moveto( x + s + (i2 * 8), y );
	       _setcolor( 0 );

	       SetPtrVis(SHOW);

	       i --;
	       if( i < 0 )
		  i = 0;

	       if( i < ( sh - 12 ) )
	       {
		  sh = i + 12;

		  i3 = 0;
		  for( i2 = sh - 12; i2 < sh; i2 ++ )
		  {
		     k3[i3] = st[i2];

		     i3 ++;
		  }
		  k3[12] = '\0';
		  TextD( x, y, k3, f );
	       }

	       break;
	 }
      }
      else
      {
	 switch( k )
	 {
	    case 0xa: /* Ctrl + Return */
	       i2 = strlen( st );
	       st[i2] = '\0';
	       *c = i;

	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       i2 = ( i - sh ) + 12;
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );
	       SetPtrVis(SHOW);

	       return( 4 );
	    case '\r':
	       break;
	    case '\t':
	       i2 = strlen( st );
	       st[i2] = '\0';
	       *c = i;

	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       i2 = ( i - sh ) + 12;
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );
	       SetPtrVis(SHOW);

	       return( 2 );
	    case '\b':
	       if( i <= 0 )
		  break;
	       i --;

	       if( i < 0 )
		  i = 0;

	       if( i < ( sh - 12 ) )
	       {
		  sh = i + 12;
	       }

	       del_ch( st, m, i );

	       i3 = 0;
	       for( i2 = sh - 12; i2 < sh; i2 ++ )
	       {
		  k3[i3] = st[i2];

		  i3 ++;
	       }
	       k3[12] = '\0';
	       TextD( x, y, k3, f );

	       break;
	    default:
	       if( i >= m )
		  break;
	       k2[0] = k;
	       SetPtrVis(HIDE);
	       _setcolor( 7 );
	       i2 = ( i - sh ) + 12;
	       _moveto( x + s + (i2 * 8) - 2, y + 14 );
	       _lineto( x + s + (i2 * 8), y + 10 );
	       _lineto( x + s + (i2 * 8) + 2, y + 14 );
	       _lineto( x + s + (i2 * 8) - 2, y + 14 );
	       _floodfill( x + s + (i2 * 8), y + 12, 7 );

	       _moveto( x + s + (i2 * 8), y );
	       _setcolor( 0 );

	       SetPtrVis(SHOW);

	       ins_ch( st, m, i, k );

	       i ++;
	       if( i >= sh )
	       {
		  sh = i;
	       }

	       i3 = 0;
	       for( i2 = sh - 12; i2 < sh; i2 ++ )
	       {
		  k3[i3] = st[i2];

		  i3 ++;
	       }
	       k3[12] = '\0';
	       TextD( x, y, k3, f );

	       break;
	 }
      }
   }
   i2 = strlen( st );
   st[i2] = '\0';
   *c = i;

   SetPtrVis(HIDE);
   _setcolor( 7 );
   i2 = ( i - sh ) + 12;
   _moveto( x + s + (i2 * 8) - 2, y + 14 );
   _lineto( x + s + (i2 * 8), y + 10 );
   _lineto( x + s + (i2 * 8) + 2, y + 14 );
   _lineto( x + s + (i2 * 8) - 2, y + 14 );
   _floodfill( x + s + (i2 * 8), y + 12, 7 );
   SetPtrVis(SHOW);

   return( 0 );
}

int del_ch( char *st, int n, int c )
{
   int i;

   for( i = c + 1; i < n; i ++ )
   {
      st[i - 1] = st[i];
   }
}

int ins_ch( char *st, int n, int c, char l )
{
   int i;

   for( i = n - 2; i >= c; i -- )
   {
      st[i+1] = st[i];
   }
   st[c] = l;
}

int ToggleButton( int x, int y, char *op, int st, int f )
{
   int i;

   SetPtrVis(HIDE);

   /* Draw box */
   if( !st )
   {
      _setcolor( 7 );
      _rectangle( _GFILLINTERIOR, x, y, x+10, y+10 );
   }
   else
   {
      _setcolor( 4 );
      _rectangle( _GFILLINTERIOR, x, y, x+10, y+10 );
   }

   _setcolor( 0 );
   _rectangle( _GBORDER, x, y, x+10, y+10 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x+9, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+9 );

      _setcolor( 8 );
      _moveto( x+1, y+9 );
      _lineto( x+9, y+9 );
      _lineto( x+9, y+1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x+9, y+1 );
      _lineto( x+1, y+1 );
      _lineto( x+1, y+9 );
   }

   /* Write text option */
   /* check background color */
   i = _getpixel( x+15, y );
   if( i > 0 )
      _setcolor( 0 );
   else
      _setcolor( 15 );

   _moveto( x+15, y );
   _outgtext( op );

   if( f )
   {
      _setcolor( 0 );
      i = strlen( op );
      i *= 8;

      _rectangle( _GBORDER, x - 2, y - 2, x + i + 17, y + 12 );
   }

   SetPtrVis(SHOW);
}

int RadioButton( int x, int y, char *op, int st, int f )
{
   int i;

   SetPtrVis(HIDE);

   /* Draw box */
   if( !st )
      _setcolor( 7 );
   else
      _setcolor( 4 );
   _moveto( x + 5, y );
   _lineto( x + 10, y + 5 );
   _lineto( x + 5, y + 10 );
   _lineto( x, y + 5 );
   _lineto( x + 5, y );
   if( !st )
      _floodfill( x + 5, y + 5, 7 );
   else
      _floodfill( x + 5, y + 5, 4 );

   if( !st )
   {
      _setcolor( 15 );
      _moveto( x + 5, y + 1 );
      _lineto( x + 9, y + 5 );
      _setcolor( 8 );
      _lineto( x + 5, y + 9 );
      _lineto( x + 1, y + 5 );
      _setcolor( 15 );
      _lineto( x + 5, y + 1 );
   }
   else
   {
      _setcolor( 8 );
      _moveto( x + 1, y + 5 );
      _lineto( x + 5, y + 1 );
      _lineto( x + 9, y + 5 );
   }
   _setcolor( 0 );
   _moveto( x + 5, y );
   _lineto( x + 10, y + 5 );
   _lineto( x + 5, y + 10 );
   _lineto( x, y + 5 );
   _lineto( x + 5, y );

   /* Write text option */
   /* check background color */
   i = _getpixel( x+15, y );
   if( i > 0 )
      _setcolor( 0 );
   else
      _setcolor( 15 );

   _moveto( x+15, y );
   _outgtext( op );

   if( f )
   {
      _setcolor( 0 );
      i = strlen( op );
      i *= 8;

      _rectangle( _GBORDER, x - 2, y - 2, x + i + 17, y + 12 );
   }


   SetPtrVis(SHOW);
}

int Window( struct WI wi )
{
   struct videoconfig vc;
   int cm, sp, nc, i, i2;
   int wx1, wx2, wy1, wy2;

   if( ( wi.stat != 2 ) && ( wi.stat != 1 ) )
      return( 0 );

   SetPtrVis(HIDE);

   if( wi.stat != 2 )
   {
      wx1 = wi.x1;
      wx2 = wi.x2;
      wy1 = wi.y1;
      wy2 = wi.y2;
   }
   else
   {
      _getvideoconfig( &vc );
      wx1 = 0;
      wy1 = 0;
      wx2 = vc.numxpixels;
      wy2 = vc.numypixels;
   }

   /* Resize border */
   _setcolor( 0 );
   _rectangle( _GBORDER, wx1, wy1, wx2, wy2 );
   _setcolor( wi.tc );
   _rectangle( _GBORDER, wx1-1, wy1-1, wx2+1, wy2+1 );
   _rectangle( _GBORDER, wx1-2, wy1-2, wx2+2, wy2+2 );

   _setcolor( 15 );
   _moveto( wx1-3, wy2+3 );
   _lineto( wx1-3, wy1-3 );
   _lineto( wx2+3, wy1-3 );
   _setcolor( 8 );
   _moveto( wx2+3, wy1-3 );
   _lineto( wx2+3, wy2+3 );
   _lineto( wx1-3, wy2+3 );

   _setcolor( 8 );
   _moveto( wx1, wy2 );
   _lineto( wx1, wy1 );
   _lineto( wx2, wy1 );
   _setcolor( 15 );
   _moveto( wx2, wy1 );
   _lineto( wx2, wy2 );
   _lineto( wx1, wy2 );

   _setcolor( 0 );
   _rectangle( _GBORDER, wx1-4, wy1-4, wx2+4, wy2+4 );

   /* Corners of resize border */
   _setcolor( 8 );             /* Upper left */
   _moveto( wx1-2, wy1 + 12 );
   _lineto( wx1, wy1 + 12 );
   _moveto( wx1 + 11, wy1 - 3 );
   _lineto( wx1 + 11, wy1 );
   _setcolor( 15 );
   _moveto( wx1-2, wy1 + 13 );
   _lineto( wx1, wy1 + 13 );
   _moveto( wx1 + 12, wy1 - 2 );
   _lineto( wx1 + 12, wy1 - 1 );

   _setcolor( 8 );           /* Upper right */
   _moveto( wx2+2, wy1 + 13 );
   _lineto( wx2, wy1 + 13 );
   _moveto( wx2 - 12, wy1 - 2 );
   _lineto( wx2 - 12, wy1 - 1 );
   _setcolor( 15 );
   _moveto( wx2+2, wy1 + 14 );
   _lineto( wx2, wy1 + 14 );
   _moveto( wx2 - 11, wy1 - 3 );
   _lineto( wx2 - 11, wy1 );

   _setcolor( 8 );             /* Lower left */
   _moveto( wx1-2, wy2 - 12 );
   _lineto( wx1, wy2 - 12 );
   _moveto( wx1 + 11, wy2 + 3 );
   _lineto( wx1 + 11, wy2 );
   _setcolor( 15 );
   _moveto( wx1-2, wy2 - 13 );
   _lineto( wx1, wy2 - 13 );
   _moveto( wx1 + 12, wy2 + 2 );
   _lineto( wx1 + 12, wy2 + 1 );

   _setcolor( 8 );           /* Lower right */
   _moveto( wx2+2, wy2 - 13 );
   _lineto( wx2, wy2 - 13 );
   _moveto( wx2 - 12, wy2 + 2 );
   _lineto( wx2 - 12, wy2 + 1 );
   _setcolor( 15 );
   _moveto( wx2+2, wy2 - 14 );
   _lineto( wx2, wy2 - 14 );
   _moveto( wx2 - 11, wy2 + 3 );
   _lineto( wx2 - 11, wy2 );

   /* Title bar */
   _setcolor( wi.tc );
   _rectangle( _GFILLINTERIOR, wx1+1,wy1+1,wx2-1,wy1+12 );
   _setcolor( 0 );
   _moveto( wx1 + 1, wy1+13 );
   _lineto( wx2 - 1, wy1+13 );

   _setcolor( 15 );
   _moveto( wx1 + 12, wy1 + 12 );
   _lineto( wx1 + 12, wy1 + 1 );
   _lineto( wx2 - 1, wy1 + 1 );
   _setcolor( 8 );
   _moveto( wx2 - 1, wy1 + 1 );
   _lineto( wx2 - 1, wy1 + 12 );
   _lineto( wx1 + 12, wy1 + 12 );

   /* Title */
   if( ( wi.tc != 15 ) && ( wi.tc != 7 ) )
      _setcolor( 15 );
   else
      _setcolor( 0 );
   _setcliprgn( wx1, wy1, wx2, wy1 + 13 );
   cm = ( ( wx2 - 1 ) - ( wx1 + 1 ) ) / 2;
   nc = strlen( wi.title );
   nc = nc * 8;
   nc = nc / 2;
   sp = cm - nc;
   _moveto( wx1 + 1 + sp, wy1 + 1 );
   _outgtext( wi.title );
   _getvideoconfig( &vc );
   _setcliprgn(0,0,vc.numxpixels,vc.numypixels);

   /* Fill the client area */
   _setcolor( wi.mfc );
   _rectangle( _GFILLINTERIOR, wx1 + 1, wy1 + 14, wx2 - 1, wy2 - 1 );

   /* Window menu */
   _setcolor( wi.tc );
   _rectangle( _GFILLINTERIOR, wx1 + 1, wy1 + 1, wx1 + 11, wy1 + 12 );
   _moveto( wx1 + 3, wy1 + 6 );
   _lineto( wx1 + 8, wy1 + 6 );

   _setcolor( 15 );
   _moveto( wx1 + 1, wy1 + 12 );
   _lineto( wx1 + 1, wy1 + 1 );
   _lineto( wx1 + 11, wy1 + 1 );
   _setcolor( 8 );
   _moveto( wx1 + 11, wy1 + 1 );
   _lineto( wx1 + 11, wy1 + 12 );
   _lineto( wx1 + 1, wy1 + 12 );

   _setcolor( 15 );
   _setpixel( wx1 + 3, wy1 + 6 );
   _moveto( wx1 + 3, wy1 + 5 );
   _lineto( wx1 + 8, wy1 + 5 );
   _setcolor( 8 );
   _setpixel( wx1 + 8, wy1 + 6 );
   _moveto( wx1 + 8, wy1 + 7 );
   _lineto( wx1 + 3, wy1 + 7 );

   /* Window buttons */
   if( !wi.typ )
   {
      /* Maximize button */

      _setcolor( 15 );
      _moveto( wx2 - 8, wy1 + 9 );
      _lineto( wx2 - 8, wy1 + 4 );
      _lineto( wx2 - 4, wy1 + 4 );
      _setcolor( 8 );
      _moveto( wx2 - 4, wy1 + 4 );
      _lineto( wx2 - 4, wy1 + 9 );
      _lineto( wx2 - 8, wy1 + 9 );

      if( wi.stat == 2 )
      {
	 _setcolor( 8 );
	 _moveto( wx2 - 1, wy1 + 1 );
	 _lineto( wx2 - 11, wy1 + 1 );
	 _lineto( wx2 - 11, wy1 + 12 );
      }
      else
      {
	 _setcolor( 15 );
	 _moveto( wx2 - 1, wy1 + 1 );
	 _lineto( wx2 - 11, wy1 + 1 );
	 _lineto( wx2 - 11, wy1 + 12 );

	 _setcolor( 8 );
	 _moveto( wx2 - 11, wy1 + 12 );
	 _lineto( wx2 - 1, wy1 + 12 );
	 _lineto( wx2 - 1, wy1 + 1 );
      }

      /* Minimize button */
      _setcolor( 15 );
      _setpixel( wx2 - 16, wy1 + 6 );
      _setpixel( wx2 - 16, wy1 + 5 );
      _setpixel( wx2 - 15, wy1 + 5 );
      _setcolor( 8 );
      _setpixel( wx2 - 15, wy1 + 6 );

      _setcolor( 15 );
      _moveto( wx2 - 12, wy1 + 1 );
      _lineto( wx2 - 20, wy1 + 1 );
      _lineto( wx2 - 20, wy1 + 12 );

      _setcolor( 8 );
      _moveto( wx2 - 20, wy1 + 12 );
      _lineto( wx2 - 12, wy1 + 12 );
      _lineto( wx2 - 12, wy1 + 1 );

      _setcolor( 8 );
      _moveto( wx2 - 21, wy1 + 12 );
      _lineto( wx2 - 21, wy1 + 1 );
   }

   /* Menu Bar */
   if( wi.mb )
   {
      _setcolor( 7 );
      _rectangle(_GFILLINTERIOR, wx1+1, wy1 + 14, wx2-1, wy1 + 27 );

      _setcliprgn( wx1, wy1 + 13, wx2, wy1 + 28 );

      _setcolor( 8 );
      _moveto( wx1+1, wy1 + 27 );
      _lineto( wx2-1, wy1 + 27 );
      _lineto( wx2-1, wy1 + 14 );

      _setcolor( 15 );
      _lineto( wx1+1, wy1 + 14 );

      _lineto( wx1+1, wy1 + 27 );

      _setcolor( 0 );
      _moveto( wx1 + 1, wy1 + 28 );
      _lineto( wx2 - 1, wy1 + 28 );
      _moveto( wx1 + 3, wy1 + 15 );

      for( i = 0; i < 10; i ++ )
      {
	 for( i2 = 0; i2 < 10; i2 ++ )
	 {
	    if( wi.mu[i][i2] == '\0' )
	       break;
	    if( !isalpha( wi.mu[i][i2] ) )
	    {
	       i2 = 12;
	       break;
	    }
	 }
	 if( i2 == 12 )
	    break;

	 if( !strlen( wi.mu[i] ) )
	    break;
	 _outgtext( wi.mu[i] );
	 _outgtext(" ");
      }
      _getvideoconfig( &vc );
      _setcliprgn(0,0,vc.numxpixels,vc.numypixels);
   }
   SetPtrVis(SHOW);
}

int Mouse( struct WI *wi )
{
   EVENT event;
   int btn, xc, yc, x1, y1, x2, y2, i, dx, dy, i2, i3, i4;
   int xc2, yc2, i5;
   struct videoconfig vc;
   char mu[6][50];

   if( ( wi->stat != 2 ) && ( wi->stat != 1 ) )
      return( -1 );

   event.fsBtn = 0;

   i = GetPtrPos(&event);
   i=0;

   btn = event.fsBtn;
   event.fsBtn = 0;

   if( !btn )
      return( -1 );

   /* Set x,y coords */
   xc = event.x;
   yc = event.y;
   if( wi->stat != 2 )
   {
      x1 = wi->x1;
      y1 = wi->y1;
      x2 = wi->x2;
      y2 = wi->y2;
   }
   else
   {
      x1 = 0;
      y1 = 0;

      _getvideoconfig( &vc );
      x2 = vc.numxpixels;
      y2 = vc.numypixels;
   }

   if( btn == 1 ) /* First Mouse button commands */
   {
      if( ( xc < x2  ) && ( yc > y1 ) && ( xc > x2 - 12 ) &&
	  ( yc < y1 + 12 ) && ( !wi->typ ) )
      {
	 /* Maximize / Restore */
	 if( wi->stat != 2 )
	 {
	    /* Maximize */
	    wi->stat = 2;
	    return( 0 );
	 }
	 else
	 {
	    /* Restore */
	    wi->stat = 1;
	    return( 0 );
	 }
      }
      if( ( xc < x2 - 12  ) && ( yc > y1 ) && ( xc > x2 - 20 ) &&
	  ( yc < y1 + 12 ) && ( !wi->typ ) )
      {
	 /* Minimize */
	 SetPtrVis( HIDE );
	 _setcolor( 8 );
	 _moveto( x2 - 12, y1 + 1 );
	 _lineto( x2 - 20, y1 + 1 );
	 _lineto( x2 - 20, y1 + 12 );

	 _setcolor( 15 );
	 _moveto( x2 - 20, y1 + 12 );
	 _lineto( x2 - 12, y1 + 12 );
	 _lineto( x2 - 12, y1 + 1 );
	 SetPtrVis( SHOW );

	 loc_rel( &xc, &yc );

	 if( ( xc < x2 - 12  ) && ( yc > y1 ) && ( xc > x2 - 20 ) &&
	     ( yc < y1 + 12 ) && ( !wi->typ ) )
	 {
	    wi->stat = 3;
	    return( 0 );
	 }
	 return( 0 );
      }
      if( ( xc > x1 ) && ( xc < x1 + 12 ) && ( yc > y1 ) &&
	  ( yc < y1 + 12 ) )
      {
	 i2 = 0;
	 for( i3 = 0; i3 < 7500; i3 ++ )
	 {
	    /* Check for double click */
	    event.fsBtn = 0;
	    i = GetMouseEvent(&event);
	    if( !i )
	       continue;
	    if( event.fsBtn == 0 )
	    {
	       i2 --;
	       continue;
	    }
	    if( ( event.fsBtn == 1 ) && ( i2 < 0 ) )
	    {
	       if( ( event.x > x1 ) && ( event.x < x1 + 12 ) &&
		   ( event.y > y1 ) && ( event.y < y1 + 12 ) )
	       {
		  i2 = 1;
	       }
	       break;
	    }
	 }
	 if( i2 > 0 )
	 {
	    /* Double click - close window */
	    wi->stat = 0;
	    return( 0 );
	 }
      }
   }
   if( ( btn == 2 ) || ( btn == 1 ) )
   {
      if( ( xc > x1 ) && ( xc < x1 + 12 ) && ( yc > y1 ) &&
	  ( yc < y1 + 12 ) )
      {
	 /* single click - Open Window Menu */
	 /* highlight box */
	 SetPtrVis(HIDE);
	 _setcolor( 8 );
	 _moveto( x1 + 1, y1 + 12 );
	 _lineto( x1 + 1, y1 + 1 );
	 _lineto( x1 + 11, y1 + 1 );
	 _setcolor( 15 );
	 _moveto( x1 + 11, y1 + 1 );
	 _lineto( x1 + 11, y1 + 12 );
	 _lineto( x1 + 1, y1 + 12 );

	 if( btn == 2 )
	    i3 = 1;
	 else
	    i3 = 0;

	 i = WindowMenu( wi, i3 );
	 SetPtrVis(SHOW);
	 return( 0 );
      }
      if( wi->mb )
      {
	 wi->mc = -1;
	 if( ( yc > y1 + 13 ) && ( yc < y1 + 24 ) && ( xc > x1 ) &&
	     ( xc < x2 ) )
	 {
	    /* Click on menu bar */
	    /* Determine menu number */
	    i = 0;
	    for( i3 = 0; i3 < 10; i3 ++ )
	    {
	       i2 = strlen( wi->mu[i3] ) * 8;
	       if( ( xc > i + 3 + x1 ) && ( xc < i2 + i + 3 + x1 ) )
	       {
		  wi->mc = i3;
		  SetPtrVis(HIDE);

		  _setcolor( 15 );
		  _moveto( i + 2 + x1, y1 + 26 );
		  _lineto( i2 + 4 + i + x1, y1 + 26 );
		  _lineto( i2 + 4 + i + x1, y1 + 15 );

		  _setcolor( 8 );
		  _lineto( i + 2 + x1, y1 + 15 );

		  _lineto( i + 2 + x1, y1 + 26 );

		  SetPtrVis(SHOW);
		  return( i3 + 1 );
	       }
	       i += i2 + 8;
	    }
	 }
      }
   }
   if( ( btn == 3 ) || ( btn == 1 ) )
   {
      if( ( ( xc > x1 + 12 ) && ( xc < x2 - 24 ) && ( yc > y1 ) &&
	  ( yc < y1 + 12 ) && ( !wi->typ ) ) ||
	  ( ( xc > x1 + 12 ) && ( xc < x2 ) && ( yc > y1 ) &&
	  ( yc < y1 + 12 ) && ( wi->typ ) ) )
      {
	 /* Move Window */
	 SetPtrVis( HIDE );
	 if( wi->typ )
	 {
	    _setcolor( 8 );
	    _moveto( x1 + 12, y1 + 12 );
	    _lineto( x1 + 12, y1 + 1 );
	    _lineto( x2 - 1, y1 + 1 );
	    _setcolor( 15 );
	    _moveto( x2 - 1, y1 + 1 );
	    _lineto( x2 - 1, y1 + 12 );
	    _lineto( x1 + 12, y1 + 12 );
	 }
	 else
	 {
	    _setcolor( 8 );
	    _moveto( x1 + 12, y1 + 12 );
	    _lineto( x1 + 12, y1 + 1 );
	    _lineto( x2 - 21, y1 + 1 );
	    _setcolor( 15 );
	    _moveto( x2 - 21, y1 + 1 );
	    _lineto( x2 - 21, y1 + 12 );
	    _lineto( x1 + 12, y1 + 12 );
	 }
	 SetPtrVis( SHOW );

	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 dx = x1 - xc;
	 dy = y1 - yc;

	 i3 = x2 - x1;
	 i4 = y2 - y1;

	 event.x = xc;
	 event.y = yc;

	 i = 1;
	 while( i )
	 {
	    xc2 = event.x;
	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER,xc2 + dx,yc2 + dy,xc2 + dx + i3,
	       yc2 + dy + i4 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;

	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER,xc2 + dx,yc2 + dy,xc2 + dx + i3,
	       yc2 + dy + i4 );
	    SetPtrVis( SHOW );
	 }

	 event.fsBtn = 0;
	 dx = event.x - xc;
	 dy = event.y - yc;
	 event.x = 0;
	 event.y = 0;
	 _setwritemode( i5 );

	 wi->x1 += dx, wi->x2 += dx;
	 wi->y1 += dy, wi->y2 += dy;
	 return( 0 );
      }
      if( ( ( xc < x1 + 12 ) && ( xc > x1 - 3 ) && ( yc > y2 ) &&
	  ( yc < y2 + 3 ) ) || ( ( xc > x1 - 3 ) && ( xc < x1  ) &&
	  ( yc < y2 + 3 ) && ( yc > y2 - 12 ) ) )
      {
	 /* Size bottom left corner */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x1;
	 event.y = y2;

	 i = 1;
	 while( i )
	 {
	    if( event.y < ( y1 + 13 ) )
	    {
	       SetPtrPos( event.x, y1 + 13 );
	       event.y = y1 + 13;
	    }
	    if( event.x > x2 )
	    {
	       SetPtrPos( x2, event.y );
	       event.x = x2;
	    }

	    xc2 = event.x;
	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle( _GBORDER, xc2, yc2, x2, y1 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle( _GBORDER, xc2, yc2, x2, y1 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x1 = event.x;
	 wi->y2 = event.y;

	 _setwritemode( i5 );
	 return( 0 );
      }
      if( ( ( xc > x2 - 12 ) && ( xc < x2 + 3 ) && ( yc > y2 ) &&
	  ( yc < y2 + 3 ) ) || ( ( xc < x2 + 3 ) && ( xc > x2  ) &&
	  ( yc < y2 + 3 ) && ( yc > y2 - 12 ) ) )
      {
	 /* Size bottom right corner */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x2;
	 event.y = y2;

	 i = 1;
	 while( i )
	 {
	    if( event.y < ( y1 + 13 ) )
	    {
	       SetPtrPos( event.x, y1 + 13 );
	       event.y = y1 + 13;
	    }
	    if( event.x < x1 )
	    {
	       SetPtrPos( x1, event.y );
	       event.x = x1;
	    }

	    xc2 = event.x;
	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x1, y1 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x1, y1 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x2 = event.x, wi->y2 = event.y;
	 _setwritemode( i5 );

	 return( 0 );
      }
      if( ( ( xc < x1 + 12 ) && ( xc > x1 - 3 ) && ( yc > y1 - 3 ) &&
	  ( yc < y1 ) ) || ( ( xc > x1 - 3 ) && ( xc < x1  ) &&
	  ( yc < y1 + 12 ) && ( yc > y1 - 3 ) ) )
      {
	 /* Size top left corner */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x1;
	 event.y = y1;

	 i = 1;
	 while( i )
	 {
	    if( event.y > ( y2 - 13 ) )
	    {
	       SetPtrPos( event.x, y2 - 13 );
	       event.y = y2 - 13;
	    }
	    if( event.x > x2 )
	    {
	       SetPtrPos( x2, event.y );
	       event.x = x2;
	    }

	    xc2 = event.x;
	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x2, y2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x2, y2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x1 = event.x;
	 wi->y1 = event.y;

	 _setwritemode( i5 );
	 return( 0 );
      }
      if( ( ( xc > x2 - 12 ) && ( xc < x2 + 3 ) && ( yc < y1 ) &&
	  ( yc > y1 - 3 ) ) || ( ( xc < x2 + 3 ) && ( xc > x2  ) &&
	  ( yc < y1 + 12 ) && ( yc > y1 - 3 ) ) )
      {
	 /* Size top right corner */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x2;
	 event.y = y1;

	 i = 1;
	 while( i )
	 {
	    if( event.y > ( y2 - 13 ) )
	    {
	       SetPtrPos( event.x, y2 - 13 );
	       event.y = y2 - 13;
	    }
	    if( event.x < x1 )
	    {
	       SetPtrPos( x1, event.y );
	       event.x = x1;
	    }

	    xc2 = event.x;
	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x1, y2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, yc2, x1, y2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x2 = event.x, wi->y1 = event.y;
	 _setwritemode( i5 );

	 return( 0 );
      }
      if( ( xc < x1 ) && ( xc > x1 - 3 ) && ( yc > y1 ) &&
	  ( yc < y2 ) )
      {
	 /* size left x coord */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x1;

	 i = 1;
	 while( i )
	 {
	    if( event.x > x2 )
	    {
	       SetPtrPos( x2, event.y );
	       event.x = x2;
	    }

	    xc2 = event.x;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, y1, x2, y2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, xc2, y1, x2, y2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x1 = event.x;

	 _setwritemode( i5 );

	 event.x = 0;
	 event.y = 0;
	 return( 0 );
      }
      if( ( xc > x2 ) && ( xc < x2 + 3 ) && ( yc > y1 ) &&
	  ( yc < y2 ) )
      {
	 /* size right x coord */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.x = x2;

	 i = 1;
	 while( i )
	 {
	    if( event.x < x1 )
	    {
	       SetPtrPos( x1, event.y );
	       event.x = x1;
	    }

	    xc2 = event.x;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, y1, xc2, y2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, y1, xc2, y2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->x2 = event.x;

	 _setwritemode( i5 );

	 event.x = 0;
	 event.y = 0;
	 return( 0 );
      }
      if( ( xc > x1 ) && ( xc < x2 ) && ( yc < y1 ) &&
	  ( yc > y1 - 3 ) )
      {
	 /* size top y coord */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.y = y1;

	 i = 1;
	 while( i )
	 {
	    if( event.y > ( y2 - 13 ) )
	    {
	       SetPtrPos( event.x, y2 - 13 );
	       event.y = y2 - 13;
	    }

	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, yc2, x2, y2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, yc2, x2, y2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->y1 = event.y;

	 _setwritemode( i5 );

	 event.x = 0;
	 event.y = 0;
	 return( 0 );
      }
      if( ( xc > x1 ) && ( xc < x2 ) && ( yc > y2 ) &&
	  ( yc < y2 + 3 ) )
      {
	 /* size bottom y coord */
	 i5 = _getwritemode();
	 _setwritemode( _GXOR );
	 event.y = y2;

	 i = 1;
	 while( i )
	 {
	    if( event.y < ( y1 + 13 ) )
	    {
	       SetPtrPos( event.x, y1 + 13 );
	       event.y = y1 + 13;
	    }

	    yc2 = event.y;
	    _setcolor( 15 );
	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, y1, x2, yc2 );
	    SetPtrVis( SHOW );

	    event.fsBtn = 0;
	    i2 = 0;
	    while( !i2 )
	       i2 = GetMouseEvent(&event);
	    i = event.fsBtn;

	    SetPtrVis( HIDE );
	    _rectangle(_GBORDER, x1, y1, x2, yc2 );
	    SetPtrVis( SHOW );
	 }
	 event.fsBtn = 0;
	 wi->y2 = event.y;

	 _setwritemode( i5 );

	 event.x = 0;
	 event.y = 0;
	 return( 0 );
      }
   }
   else
   {
      return( 0 );
   }
   return( -1 );
}
