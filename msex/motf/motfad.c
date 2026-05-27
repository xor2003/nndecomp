/* Module of add-ons to basic Motif components.
 * To use this, include motfad.h, motfsm.h, and link
 * this file and motfsm.c (or .obj) to your file.
 */

#include <stdio.h>
#include <graph.h>
#include <process.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <malloc.h>

#include "mouse.h"
#include "motfsm.h"
#include "motfad.h"

/* An Error Drawing (!) */
int ErrorDrawing( int x, int y )
{
   _ellipse( _GFILLINTERIOR, x, y, x + 5, y + 20 );
   _ellipse( _GFILLINTERIOR, x, y + 25, x + 5, y + 30 );
}

/* Working Drawing (hourglass) */
int WorkingDrawing( int x, int y )
{
   int c;

   c = _getcolor();

   _moveto( x, y );
   _lineto( x + 10, y );
   _lineto( x, y + 20 );
   _lineto( x + 10, y + 20 );
   _lineto( x, y );
   _floodfill( x + 5, y + 3, c );
   _floodfill( x + 5, y + 17, c );
}

/* An Information Symbol (i) */
int InfoDrawing( int x, int y )
{
   _rectangle( _GFILLINTERIOR, x, y + 10, x + 5, y + 23 );
   _ellipse( _GFILLINTERIOR, x, y, x + 5, y + 5 );
}

/* Question Drawing (?) */
int QuestionDrawing( int x, int y )
{
   int cc;

   cc = _getcolor();

   _rectangle( _GFILLINTERIOR, x + 22, y + 25, x + 26, y + 16 );
   _arc( x + 14, y + 1, x + 35, y + 19, x + 25, y + 13, x + 10, y + 13 );
   _arc( x + 17, y + 5, x + 31, y + 16, x + 25, y + 13, x + 15, y + 13 );
   _moveto( x + 14, y + 13 );
   _lineto( x + 17, y + 13 );
   _floodfill( x + 15, y + 11, cc );
   _ellipse( _GFILLINTERIOR, x + 22, y + 28, x + 26, y + 32 );
}

/* Draw and use an Information Dialog Box */
int InfoDialog( int x, int y, char *str, char *title )
{
   char _huge *im;
   long ims;
   int f, k, xc, yc;
   struct WI w;
   struct component c[1];

   w.x1 = x;
   w.y1 = y;
   w.x2 = x + ( strlen( str ) * 8 ) + 70;
   w.y2 = y + 100;
   strcpy( w.title, title );
   w.typ = 1;
   w.mb = 0;
   w.stat = 1;
   w.tc = 7;
   w.mfc = 7;

   ims = _imagesize( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5 );
   im = halloc( ims, 1 );
   if( im == NULL )
   {
      end_gui();
      printf("Out of Memory!\n");
      exit( 1 );
   }
   xc = w.x1 - 5, yc = w.y1 - 5;
   _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

   c[0].c = _PushButton;
   c[0].v = 0;
   c[0].v6 = 1;
   c[0].x = ( ( w.x2 + x ) / 2 ) - x;
   c[0].y = w.y2 - 30 - y;
   strcpy( c[0].d, "OK" );

   f = 0;
   while( 1 )
   {
      SetPtrVis( HIDE );
      _putimage( xc, yc, im, _GPSET );

      xc = w.x1 - 5, yc = w.y1 - 5;
      _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

      SetPtrVis( SHOW );

      Window( w );
      draw_comp( w, c[0], 1 );

      SetPtrVis( HIDE );

      _setcolor( 8 );
      InfoDrawing( w.x1 + 10, w.y1 + 25 );

      _setcolor( 0 );
      _moveto( w.x1 + 30, w.y1 + 35 );
      _outgtext( str );

      SetPtrVis( SHOW );

      i_act( &w, c, 1, 1, &f, &k );

      if( ( w.x1 - 5 ) <= 0 )
	 w.x1 = 6;

      if( ( w.y1 - 5 ) <= 0 )
	 w.y1 = 6;

      w.x2 = w.x1 + ( strlen( str ) * 8 ) + 70;
      w.y2 = w.y1 + 100;

      if( c[0].v )
      {
	 SetPtrVis( HIDE );
	 _putimage( xc, yc, im, _GPSET );
	 SetPtrVis( SHOW );
	 hfree( im );
	 return( 1 );
      }

      if( !w.stat )
	 break;
   }
   SetPtrVis( HIDE );
   _putimage( xc, yc, im, _GPSET );
   SetPtrVis( SHOW );
   hfree( im );
   return( 0 );
}

/* Draw and use an Question Dialog Box */
int QuestionDialog( int x, int y, char *str, char *title )
{
   char _huge *im;
   long ims;
   int f, k, xc, yc;
   struct WI w;
   struct component c[2];

   w.x1 = x;
   w.y1 = y;
   w.x2 = x + ( strlen( str ) * 8 ) + 70;

   if( ( w.x2 - x ) < 270 )
      w.x2 = x + 270;

   w.y2 = y + 100;
   strcpy( w.title, title );
   w.typ = 1;
   w.mb = 0;
   w.stat = 1;
   w.tc = 7;
   w.mfc = 7;

   ims = _imagesize( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5 );
   im = halloc( ims, 1 );
   if( im == NULL )
   {
      end_gui();
      printf("Out of Memory!\n");
      exit( 1 );
   }
   xc = w.x1 - 5, yc = w.y1 - 5;
   _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

   c[0].c = _PushButton;
   c[0].v = 0;
   c[0].v6 = 1;
   c[0].x = 10;
   c[0].y = w.y2 - 30 - y;
   strcpy( c[0].d, "Yes" );

   c[1].c = _PushButton;
   c[1].v = 0;
   c[1].v6 = 0;
   c[1].x = 140;
   c[1].y = w.y2 - 30 - y;
   strcpy( c[1].d, "No" );

   f = 0;
   while( 1 )
   {
      SetPtrVis( HIDE );
      _putimage( xc, yc, im, _GPSET );

      xc = w.x1 - 5, yc = w.y1 - 5;
      _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

      SetPtrVis( SHOW );

      Window( w );
      draw_comp( w, c[0], !f );
      draw_comp( w, c[1], f );

      SetPtrVis( HIDE );

      _setcolor( 8 );
      QuestionDrawing( w.x1, w.y1 + 25 );

      _setcolor( 0 );
      _moveto( w.x1 + 50, w.y1 + 35 );
      _outgtext( str );

      SetPtrVis( SHOW );

      i_act( &w, c, 2, 1, &f, &k );

      if( ( w.x1 - 5 ) <= 0 )
	 w.x1 = 6;

      if( ( w.y1 - 5 ) <= 0 )
	 w.y1 = 6;

      w.x2 = w.x1 + ( strlen( str ) * 8 ) + 70;

      if( ( w.x2 - w.x1 ) < 270 )
	 w.x2 = w.x1 + 270;

      w.y2 = w.y1 + 100;

      if( c[0].v )
      {
	 SetPtrVis( HIDE );
	 _putimage( xc, yc, im, _GPSET );
	 SetPtrVis( SHOW );
	 hfree( im );
	 return( 1 );
      }

      if( c[1].v )
      {
	 SetPtrVis( HIDE );
	 _putimage( xc, yc, im, _GPSET );
	 SetPtrVis( SHOW );
	 hfree( im );
	 return( 0 );
      }

      if( !w.stat )
	 break;
   }
   SetPtrVis( HIDE );
   _putimage( xc, yc, im, _GPSET );
   SetPtrVis( SHOW );
   hfree( im );
   return( -1 );

}

/* Draw and use an Error Dialog Box */
int ErrorDialog( int x, int y, char *str, char *title )
{
   char _huge *im;
   long ims;
   int f, k, xc, yc;
   struct WI w;
   struct component c[2];

   w.x1 = x;
   w.y1 = y;
   w.x2 = x + ( strlen( str ) * 8 ) + 70;

   if( ( w.x2 - x ) < 270 )
      w.x2 = x + 270;

   w.y2 = y + 100;
   strcpy( w.title, title );
   w.typ = 1;
   w.mb = 0;
   w.stat = 1;
   w.tc = 7;
   w.mfc = 7;

   ims = _imagesize( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5 );
   im = halloc( ims, 1 );
   if( im == NULL )
   {
      end_gui();
      printf("Out of Memory!\n");
      exit( 1 );
   }
   xc = w.x1 - 5, yc = w.y1 - 5;
   _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

   c[0].c = _PushButton;
   c[0].v = 0;
   c[0].v6 = 1;
   c[0].x = 10;
   c[0].y = 75;
   strcpy( c[0].d, "OK" );

   c[1].c = _PushButton;
   c[1].v = 0;
   c[1].v6 = 0;
   c[1].x = 140;
   c[1].y = 75;
   strcpy( c[1].d, "Cancel" );

   f = 0;
   while( 1 )
   {
      SetPtrVis( HIDE );
      _putimage( xc, yc, im, _GPSET );

      xc = w.x1 - 5, yc = w.y1 - 5;
      _getimage( w.x1 - 5, w.y1 - 5, w.x2 + 5, w.y2 + 5, im );

      SetPtrVis( SHOW );

      Window( w );
      draw_comp( w, c[0], !f );
      draw_comp( w, c[1], f );

      SetPtrVis( HIDE );
      _setcolor( 8 );
      ErrorDrawing( w.x1 + 10, w.y1 + 25 );

      _setcolor( 0 );
      _moveto( w.x1 + 50, w.y1 + 35 );
      _outgtext( str );
      SetPtrVis( SHOW );

      i_act( &w, c, 2, 1, &f, &k );

      if( ( w.x1 - 5 ) <= 0 )
	 w.x1 = 6;

      if( ( w.y1 - 5 ) <= 0 )
	 w.y1 = 6;

      w.x2 = w.x1 + ( strlen( str ) * 8 ) + 70;

      if( ( w.x2 - w.x1 ) < 270 )
	 w.x2 = w.x1 + 270;

      w.y2 = w.y1 + 100;

      if( c[0].v )
      {
	 SetPtrVis( HIDE );
	 _putimage( xc, yc, im, _GPSET );
	 SetPtrVis( SHOW );
	 hfree( im );
	 return( 1 );
      }

      if( c[1].v )
      {
	 SetPtrVis( HIDE );
	 _putimage( xc, yc, im, _GPSET );
	 SetPtrVis( SHOW );
	 hfree( im );
	 return( 0 );
      }

      if( !w.stat )
	 break;
   }
   SetPtrVis( HIDE );
   _putimage( xc, yc, im, _GPSET );
   SetPtrVis( SHOW );
   hfree( im );
   return( -1 );

}

int get_f( char *path, char files[][13], int i )
{
   FILE *fp;
   int i2, i3;
   char str[80], fil[13];

   for( i2 = 0; i2 < i; i2 ++ )
      for( i3 = 0; i3 < 13; i3 ++ )
	 files[i2][i3] = 0;

   strcpy( str, "dir " );
   strcat( str, path );
   strcat( str, " /B /A-D /ON > jnk.txt" );

   system( str );

   fp = fopen( "jnk.txt", "r" );

   for( i2 = 0; i2 < i; i2 ++ )
   {
      if( fgets( fil, 13, fp ) == NULL )
	 break;

      if( ( fil[0] == '\0' ) ||
	  ( fil[0] == '\n' ) ||
	  ( fil[0] == '\a' ) ||
	  ( fil[0] == '\r' ) )
      {
	 i2 --;
	 continue;
      }

      for( i3 = 0; i3 < 50; i3 ++ )
	 if( fil[i3] == '\n' )
	 {
	    fil[i3] = '\0';
	    break;
	 }

      strcpy( files[i2], fil );
   }
   fclose( fp );

   system( "del jnk.txt" );

}

int get_d( char *path, char files[][13], int i )
{
   FILE *fp;
   int i2, i3;
   char str[80], str2[50], fil[13];

   for( i2 = 0; i2 < i; i2 ++ )
      for( i3 = 0; i3 < 13; i3 ++ )
	 files[i2][i3] = 0;

   /* Parse off any extension. . . */
   strcpy( str2, path );

   for( i2 = 0; i2 < 50; i2 ++ )
      if( str2[i2] == '\0' )
	 break;

   for( ; i2 >= 0; i2 -- )
      if( str2[i2] == '\\' )
      {
	  str2[i2+1] = '\0';
	  break;
      }

   /* . . . And add wildcards */
   strcat( str2, "*.*" );

   strcpy( str, "dir " );
   strcat( str, str2 );
   strcat( str, " /B /AD /ON > jnk.txt" );

   system( str );

   fp = fopen( "jnk.txt", "r" );

   strcpy( files[0], ".." );

   for( i2 = 1; i2 < i; i2 ++ )
   {
      if( fgets( fil, 13, fp ) == NULL )
	 break;

      if( fil[0] == '\0' )
      {
	 i2 --;
	 continue;
      }

      for( i3 = 0; i3 < 50; i3 ++ )
	 if( fil[i3] == '\n' )
	 {
	    fil[i3] = '\0';
	    break;
	 }

      strcpy( files[i2], fil );
   }
   fclose( fp );

   system( "del jnk.txt" );
}

int add_dir( char *path, char *dir )
{
   int i, i2, i3, i4;
   char str2[13];

   /* Parse off any extension. . . */
   for( i2 = 0; i2 < 50; i2 ++ )
      if( path[i2] == '\0' )
	 break;

   i3 = i2;

   for( ; i2 >= 0; i2 -- )
      if( path[i2] == '\\' )
      {
	  /* Save extension for later */
	  i4 = 0;
	  for( i = i2 + 1; i < i3; i ++ )
	     str2[i4] = path[i], i4 ++;

	  str2[i4] = '\0';

	  path[i2+1] = '\0';
	  break;
      }

   /* Add new directory */
   strcat( path, dir );
   strcat( path, "\\" );

   /* . . . And add saved extension */
   strcat( path, str2 );

}

int sub_dir( char *path )
{
   int i, i2, i3, i4, i5;
   char str2[13];

   /* Parse off any extension. . . */
   for( i2 = 0; i2 < 50; i2 ++ )
      if( path[i2] == '\0' )
	 break;

   i3 = i2;

   i5 = 0;
   for( ; i2 >= 0; i2 -- )
   {
      if( path[i2] == '\\' )
      {
	  if( ! i5 )
	  {
	     /* Save extension for later */
	     i4 = 0;
	     for( i = i2 + 1; i < i3; i ++ )
		str2[i4] = path[i], i4 ++;

	     str2[i4] = '\0';

	     i5 = 1;
	  }
	  else
	  {
	     path[i2+1] = '\0';
	     break;
	  }
      }
   }

   /* . . . And add saved extension */
   strcat( path, str2 );
}

int init_fsd( int x,
	      int y,
	      struct WI *w,
	      char *t,
	      struct component c[],
	      char *filt
	    )
{
   int i;

   strcpy( w->title, t );
   w->x1 = x;
   w->y1 = y;
   w->typ = 1;
   w->x2 = x + 430;
   w->y2 = y + 257;
   w->mb = 0;
   w->stat = 1;
   w->mfc = 7;
   w->tc= 7;

   c[0].c = _Text;
   c[0].x = 10;
   c[0].y = 32;
   c[0].v = 0;
   c[0].v2 = 0;
   c[0].v3 = 0;
   c[0].v4 = 0;
   c[0].v5 = 0;
   c[0].v6 = 30;
   strcpy( c[0].d, filt );

   c[1].c = _List;
   c[1].x = 10;
   c[1].y = 67;
   c[1].l = 10;
   c[1].v = 0;
   c[1].v2 = 0;
   c[1].v3 = -1;
   c[1].v6 = 0;

   c[2].c = _ScrollBarV;
   c[2].x = 134;
   c[2].y = 67;
   c[2].l = 100;
   c[2].v2 = 0;
   c[2].v3 = 1;
   c[2].v4 = 0;
   c[2].v6 = 0;

   c[3].c = _List;
   c[3].x = 165;
   c[3].y = 67;
   c[3].l = 10;
   c[3].v = 0;
   c[3].v2 = 0;
   c[3].v3 = -1;
   c[3].v6 = 0;

   c[4].c = _ScrollBarV;
   c[4].x = 289;
   c[4].y = 67;
   c[4].l = 100;
   c[4].v2 = 0;
   c[4].v3 = 1;
   c[4].v4 = 0;
   c[4].v6 = 0;

   c[5].c = _Text;
   c[5].x = 10;
   c[5].y = 197;
   c[5].v = 0;
   c[5].v2 = 0;
   c[5].v3 = 0;
   c[5].v4 = 0;
   c[5].v5 = 0;
   c[5].v6 = 30;
   for( i = 0; i < 30; i ++ )
      c[5].d[i] = 0;

   c[6].c = _PushButton;
   c[6].x = 5;
   c[6].y = 227;
   c[6].v = 0;
   c[6].v6 = 1;
   strcpy( c[6].d, "OK" );

   c[7].c = _PushButton;
   c[7].x = 115;
   c[7].y = 227;
   c[7].v = 0;
   c[7].v6 = 0;
   strcpy( c[7].d, "Filter" );

   c[8].c = _PushButton;
   c[8].x = 220;
   c[8].y = 227;
   c[8].v = 0;
   c[8].v6 = 0;
   strcpy( c[8].d, "Cancel" );

   c[9].c = _PushButton;
   c[9].x = 325;
   c[9].y = 227;
   c[9].v = 0;
   c[9].v6 = 0;
   strcpy( c[9].d, "Help" );
}

int file_path( char *file, char *path )
{
   int i, i2, i3, i4, i5;
   char str2[13];

   /* Parse off any extension. . . */
   for( i2 = 0; i2 < 50; i2 ++ )
      if( path[i2] == '\0' )
	 break;

   i3 = i2;

   i5 = 0;
   for( ; i2 >= 0; i2 -- )
   {
      if( path[i2] == '\\' )
      {
	 path[i2+1] = '\0';
	 break;
      }
   }

   /* . . . And add filename */
   strcat( path, file );
}

/* Draw and use a FileSelectionDialog Box */
int FileSelectionDialog( int x, int y, char *t, char *filt, char *fi, int mx )
{
   int i, i2, f, kom, o, nf = 20, nfls, ndirs;
   struct WI w;
   double pos, pos2;
   struct component c[20];
   char files[20][13], dirs[20][13];

   init_fsd( x, y, &w, t, c, filt );

   f = 6;
   o = 1;

   get_f( filt, files, nf );

   for( i = 0; i < nf; i ++ )
      if( files[i][0] == '\0' )
	 break;

   c[3].v = i;
   nfls = i;

   if( i > 10 )
   {
      c[4].v3 = 10./i;
      c[4].v5 = 1./i;
      c[4].v6 = 10;
   }
   else
   {
      c[4].v3 = 1;
      c[4].v5 = 0;
      c[4].v6 = 0;
   }
   pos = 0;

   get_d( filt, dirs, nf );

   for( i = 0; i < nf; i ++ )
      if( dirs[i][0] == '\0' )
	 break;

   c[1].v = i;
   ndirs = i;

   if( i > 10 )
   {
      c[2].v3 = 10./i;
      c[2].v5 = 2./i;
      c[2].v6 = 10;
   }
   else
   {
      c[2].v3 = 1;
      c[2].v5 = 0;
      c[2].v6 = 0;
   }
   pos2 = 0;

   do
   {
      if( o == 1 )
      {
	 Window( w );
	 for( i = 0; i < 10; i ++ )
	    draw_comp( w, c[i], ( f == i ) );

	 /* Labels */
	 SetPtrVis( HIDE );

	 _setcolor( 0 );
	 _moveto( w.x1 + 10, w.y1 + 20 );
	 _outgtext( "Filter" );

	 _moveto( w.x1 + 10, w.y1 + 56 );
	 _outgtext( "Directories" );

	 _moveto( w.x1 + 11, w.y1 + 68 );
	 i2 = 0;
	 for( i = c[1].v2; i < 10 + c[1].v2; i ++ )
	 {
	    if( i >= ndirs )
	       break;

	    _moveto( w.x1 + 11, w.y1 + 68 + ( 11 * i2 ) );
	    _outgtext( dirs[i] );
	    i2 ++;
	 }

	 _moveto( w.x1 + 165, w.y1 + 56 );
	 _outgtext( "Files" );

	 _moveto( w.x1 + 166, w.y1 + 68 );
	 i2 = 0;
	 for( i = c[3].v2; i < 10 + c[3].v2; i ++ )
	 {
	    if( i >= nfls )
	       break;

	    _moveto( w.x1 + 166, w.y1 + 68 + ( 11 * i2 ) );
	    _outgtext( files[i] );
	    i2 ++;
	 }

	 _moveto( w.x1 + 10, w.y1 + 186 );
	 _outgtext( "Selection" );

	 SetPtrVis( SHOW );
      }
      if( o == 5 )
      {
	 SetPtrVis( HIDE );
	 draw_comp( w, c[f], 1 );
	 _setcolor( 0 );
	 if( f == 3 )
	 {
	    _moveto( w.x1 + 166, w.y1 + 68 );
	    i2 = 0;
	    for( i = c[3].v2; i < 10 + c[3].v2; i ++ )
	    {
	       if( i >= nfls )
		  break;

	       _moveto( w.x1 + 166, w.y1 + 68 + ( 11 * i2 ) );
	       _outgtext( files[i] );
	       i2 ++;
	    }
	 }

	 if( f == 1 )
	 {
	    _moveto( w.x1 + 11, w.y1 + 68 );
	    i2 = 0;
	    for( i = c[1].v2; i < 10 + c[1].v2; i ++ )
	    {
	       if( i >= ndirs )
		  break;

	       _moveto( w.x1 + 11, w.y1 + 68 + ( 11 * i2 ) );
	       _outgtext( dirs[i] );
	       i2 ++;
	    }
	 }
	 SetPtrVis( SHOW );
      }

      c[4].v2 = c[3].v2 / ( nfls - 10. );
      c[2].v2 = c[1].v2 / ( ndirs - 10. );

      draw_comp( w, c[2], 0 );
      draw_comp( w, c[4], 0 );

      pos = c[4].v2;
      pos2 = c[2].v2;

      o = i_act( &w, c, 10, 1, &f, &kom );

      if( pos != c[4].v2 )
      {
	 /* User has scrolled the "Files" ScrollBar */
	 if( c[4].v2 < 0 )
	    c[4].v2 = 0;
	 if( c[4].v2 > 1 )
	    c[4].v2 = 1;

	 i = c[4].v2 * ( nfls - 10. );

	 c[3].v6 = i;
	 c[3].v2 = i;

	 f = 3;
	 o = 5;
      }

      if( pos2 != c[2].v2 )
      {
	 /* User has scrolled the "Directories" ScrollBar */
	 if( c[2].v2 < 0 )
	    c[2].v2 = 0;
	 if( c[2].v2 > 1 )
	    c[2].v2 = 1;

	 i = c[2].v2 * ( ndirs - 10. );

	 c[1].v6 = i;
	 c[1].v2 = i;

	 f = 1;
	 o = 5;
      }

      strcpy( filt, c[0].d );

      if( f == 3 )
      {
	 i = c[3].v3;
	 strcpy( fi, files[i] );
	 strcpy( c[5].d, fi );

	 SetPtrVis( HIDE );
	 draw_comp( w, c[5], ( f == 5 ) );
	 SetPtrVis( SHOW );
      }
      else
      {
	 strcpy( fi, c[5].d );
      }

      if( c[6].v )
      {
	 /* OK */
	 o = 2;
	 continue;
      }

      if( c[7].v )
      {
	 c[7].v = 0;
	 get_f( filt, files, nf );
	 for( i = 0; i < nf; i ++ )
	    if( files[i][0] == '\0' )
	       break;

	 c[3].v = i;

	 nfls = i;

	 if( i > 10 )
	 {
	    c[4].v3 = 10./i;
	    c[4].v5 = 1./i;
	    c[4].v6 = 10;
	 }
	 else
	 {
	    c[4].v3 = 1;
	    c[4].v5 = 0;
	    c[4].v6 = 0;
	 }

	 pos = 0;

	 get_d( filt, dirs, nf );

	 for( i = 0; i < nf; i ++ )
	    if( dirs[i][0] == '\0' )
	       break;

	 c[1].v = i;
	 ndirs = i;

	 if( i > 10 )
	 {
	    c[2].v3 = 10./i;
	    c[2].v5 = 1./i;
	    c[2].v6 = 10;
	 }
	 else
	 {
	    c[2].v3 = 1;
	    c[2].v5 = 0;
	    c[2].v6 = 0;
	 }

	 pos2 = 0;

	 o = 1;
      }

      if( c[8].v )
      {
	 /* Cancel */
	 o = 3;
	 continue;
      }

      if( ( o == 2 ) || ( o == 3 ) )
      {
	 if( f == 1 )
	 {
	    o = 1;
	    i = c[1].v3;

	    if( dirs[i][0] == '.' )
	    {
	       sub_dir( filt );
	       strcpy( c[0].d, filt );
	    }
	    else
	    {
	       add_dir( filt, dirs[i] );
	       strcpy( c[0].d, filt );
	    }
	    get_f( filt, files, nf );
	    for( i = 0; i < nf; i ++ )
	       if( files[i][0] == '\0' )
		  break;

	    c[3].v = i;

	    nfls = i;

	    if( i > 10 )
	    {
	       c[4].v3 = 10./i;
	       c[4].v5 = 1./i;
	       c[4].v6 = 10;
	    }
	    else
	    {
	       c[4].v3 = 1;
	       c[4].v5 = 0;
	       c[4].v6 = 0;
	    }
	    pos = 0;

	    get_d( filt, dirs, nf );

	    for( i = 0; i < nf; i ++ )
	       if( dirs[i][0] == '\0' )
		  break;

	    c[1].v = i;
	    ndirs = i;

	    if( i > 10 )
	    {
	       c[2].v3 = 10./i;
	       c[2].v5 = 1./i;
	       c[2].v6 = 10;
	    }
	    else
	    {
	       c[2].v3 = 1;
	       c[2].v5 = 0;
	       c[2].v6 = 0;
	    }
	    pos2 = 0;
	 }
      }

   }while( ( o != 2 ) && ( o != 3 ) );

   file_path( fi, filt );
   strcpy( fi, filt );

   /* OK'ed */
   if( o == 2 )
      return( 0 );

   /* Canceled */
   if( o == 3 )
      return( 1 );
}
