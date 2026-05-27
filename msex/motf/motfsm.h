/* Header file for motfsm.c */

/* Window structure */
struct WI
{
   /* x,y locations of corners of window */
   int x1,y1,x2,y2;
   /* status of window - 0 = inactive, 1 = active restore, 2 = active max,
      3 = active min */
   int stat;
   /* color of title bar */
   int tc;
   /* order of window */
   int ord;
   /* title name */
   char title[50];
   /* menu bar - 0 = off, 1 = on */
   int mb;
   /* menu names ( used if mb == 1 ), max is 10 menus */
   char mu[10][10];
   /* click on menu ( -1 if no menu clicked ) */
   int mc;
   /* Main field color */
   int mfc;
   /* Type of window - 0 = normal, 1 = dialog box */
   int typ;
}wi;

struct MENU
{
   char op[10][10];
}mnu;

enum ct{
   _NullComp, _PushButton, _OptionButton, _ScrollBarH, _ScrollBarV,
   _ScaleH, _ScaleV, _Text, _ToggleButton, _RadioButton, _List
}ctyp;

struct component{
   enum ct c;             /* Component Type */
   int v, v6;             /* Misc. Vars */
   double v2, v3, v4, v5; /* Misc. Vars */
   int x, y, l;           /* (x,y) length (or misc.) */
   char d[30];            /* Label or textual data */
}c;

/* Message box drawings */
#define ERD 1
#define IND 2
#define QQD 3

/* Start / finish gui session
 * init_gui returns: 0  = success
 *                   -5 = font set error
 *                   -6 = mouse not present
 *                   -4 = appropriate graphics mode not present
 *                   else = couldn't find fonts on current directory
 * end_gui returns: none
 */
int init_gui( void );
int end_gui( void );

/* Draw a long button */
int lbtn( int x, int y, char *txt, int st );

/* Draw a left justified long button */
int lbtnl( int x, int y, char *txt, int st );

/* Draw a scroll bar - horizontal and vertical
 * Vars:
 * <x>,<y> are x,y screen coords of upper left corner of ScrollBar
 * <l> = length of ScrollBar
 * <p> = position (percent) of the slider
 * <fra> = fraction of total stuff the thing being scrolled shows
 */
int sbarh( int x, int y, int l, double p, double fra );
int sbarv( int x, int y, int l, double p, double fra );

/* Run a ScrollBar (using mouse only)
 * Vars:
 * <hl> = nonzero for horizontal ScrollBar
 * <small> = fraction that an arrow moves <p>
 * <large> = fraction that a click in the trough moves <p>
 * other vars are same as sbarh, and sbarv
 */
int RunScrollBar( int x, int y,
		  int l,
		  double *p,
		  double fra,
		  int hl,
		  double small,
		  int large
		);

/* Locate point of mouse button release */
int loc_rel( int *x, int *y );

/* Wait for mouse button release */
int wait_for_release( );

/* Check to see if location (xc,yc) is in button with upper left corner
 * (x,y), return 1 if true */
int if_btn( int x, int y, int xc, int yc );

/* Check to see if location (xc,yc) is in long button with upper left corner
 * (x,y), return 1 if true */
int if_lbtn( int x, int y, int xc, int yc );

/* Erase a button menu with upper left corner (x,y) and n options */
int e_b_mnu( int x, int y, int n );

/* Turn pointer into hourglass */
int h_glass( void );

/* return pointer to normal */
int s_ptr( void );

/* Use a button, return 1 if pressed */
int u_btn( int x, int y, char *nm );

/* Draw a Motif compliant button.
 * Vars:
 * <x>,<y> are x,y screen coords of upper left corner of button
 * <txt> is the label
 * <st> is nonzero if button is pushed in
 * <b> is nonzero if the button is default
 * <f> is nonzero if the button has focus
 */
int PushButton( int x, int y, char *txt, int st, int b, int f );

/* a Motif Compliant OptionButton, vars mean what is meant above */
int OptionButton( int x, int y, char *txt, int st, int f );

/* use Motif Compliant Pulldown Menu
 * Vars:
 * <x>,<y> are x,y screen coords of upper left corner of menu
 * <op> is array of menu choises
 * <n> is number of menu choises
 * <p> is post set, 0 = spring-loaded, 1 = post it, -1 is figure it out
 *     inside the routine (mouse only)
 * Returns:
 * >=0 = menu choise array element
 * -1 = canceled by user
 * -2 = user pressed left arrow
 * -3 = user pressed right arrow (not on a CascadeButton)
 *
 * Important !!! <op> options: (n represents any element)
 * set element[n][49] to nonzero to make that option a CascadeButton
 * set element[n][48] to nonzero to make that option unavailable
 */
int PulldownMenu( int x, int y, char op[][50], int n, int p );

/* An OptionMenu, all vars are the same as PulldownMenu,
 * except <c> which tells which option should be default
 */
int OptionMenu( int x, int y, char op[][50], int n, int p, int c );

/* a Motif Compliant CascadeButton, vars mean what is meant above
 * (in PushButton)
 */
int CascadeButton( int x, int y, char *txt, int st );

/* Draw a Pulldown Menu
 * Vars:
 * <x>,<y> are x,y screen coords of upper left corner of menu
 * <op> is array of menu choises
 * <n> is number of menu choises
 */
int PulldownMenuD( int x, int y, char op[][50], int n );

/* Draw a Motif Compliant Scale
 * Vars:
 * <x>,<y> are x,y screen coords of upper left corner of scale
 * <l> = length of scale
 * <p> = location of slider
 * <n> = minimum value of scale
 * <ax> = maximum value of scale
 * <hl> = 0 for vertical scale, nonzero for horizontal
 * <f> = nonzero if scale has focus
 */
int Scale( int x, int y, int l, double p, double n, double ax, int hl,
	   int f );

/* Change pointer to an I-beam */
int Ibeam( void );

/* Single line Motif text input
 * Vars:
 * <x>,<y> = x,y screen coords of upper left corner of text field
 * <st> = text in field (I/O)
 * <f> = nonzero if field has focus
 * <c> = cursor location in field (characters) (I/O)
 * <m> = nonzero if mouse is active
 */
int Text( int x, int y, char *st, int f, int *c, int m );

/* Draw Text input field
 * Vars:
 * <x>,<y> = x,y screen coords of upper left corner of text field
 * <st> = text in field (I/O)
 * <f> = nonzero if field has focus
 */
int TextD( int x, int y, char *st, int f );

/* Motif window */
int Window( struct WI wi );

/* Click */
int Mouse( struct WI *wi );

/* Draw component, does not draw window
 * Vars:
 * <w> = window to place component in
 * <c> = the component structure
 * <f> = nonzero if the component has the focus
 */
int draw_comp( struct WI w, struct component c, int f );

/* Motif ToggleButton
 * Vars:
 * <x>,<y> = x,y screen coords of upper left corner of ToggleButton
 * <op> = label for ToggleButton
 * <st> = nonzero if ToggleButton is toggled
 * <f> = nonzero if ToggleButton has focus
 */
int ToggleButton( int x, int y, char *op, int st, int f );

/* Motif RadioButton
 * Vars:
 * <x>,<y> = x,y screen coords of upper left corner of RadioButton
 * <op> = label for RadioButton
 * <st> = nonzero if RadioButton is toggled
 * <f> = nonzero if RadioButton has focus
 */
int RadioButton( int x, int y, char *op, int st, int f );

/* Interact with a Motif Window using components <c>, waits for user
 * to interact
 *
 * <n> - number of components
 * <m> - mouse on/off flag (nonzero = on)
 * <f> - focus on which component
 * <kom> - 1 if keyboard was used to do action (listed below)
 * The <kom> var will be used by routine on the following:
 *    menu interaction
 * Return Values:
 * <0 - opened menu (invert and -1 to get menu array number)
 * 0 - unknown command/nothing done, no redraw requested
 * 1 - did something to component/focus (redraw necessary)
 * 2 - Cancel operation selected
 * 3 - Default operation selected
 * 4 - did something to component, no redraw needed
 * 5 - redraw of focused component necessary
 * 6 - cycle within window family
 * 7 - cycle to next window family
 */
int i_act( struct WI *w,
	   struct component c[],
	   int n,
	   int m,
	   int *f,
	   int *kom
	 );

/* Performs same task as i_act, but doesn't wait for user */
int q_act( struct WI *w,
	   struct component c[],
	   int n,
	   int m,
	   int *f,
	   int *kom
	 );

/* Delete and insert characters into string
 * Vars:
 * <st> = string
 * <n> = number of characters in string
 * <c> = locaton of character to insert/delete
 * <l> = the character to insert
 */
int del_ch( char *st, int n, int c );
int ins_ch( char *st, int n, int c, char l );

/* Window Menu
 * <w> = the window
 * <p> = post set (see PulldownMenu)
 */
int WindowMenu( struct WI *w, int p );

/* Toggle location cursor around a component tog = 0 when off */
int LocationCursor( struct WI w, struct component c, int tog );

/* return 1 if mouse pointer is in rectangle boxed parameters
 * set <b> to:
 * -1 to return 0 if no mouse buttons are pressed
 * 0 to disregard mouse buttons
 * 1 to return 0 if first button not pressed
 * 2 to return 0 if second button not pressed
 * 3 to return 0 if third button not pressed
 */
int ptr_in_zn( int x1, int y1, int x2, int y2, int b );

/* Open a menu <n> from menu bar, <p> is post status (See PulldownMenu) */
int m_bar_Menu( struct WI w, int n, char op[][50], int num, int p );

/* Highlight menu <n> in window <w> */
int HighlightMenu( struct WI w, int n );

/* Draw a List, upper left corner at (<x>,<y>), <l> is length of list
 * data to be shown.  Programmer must fill in data. <aa> is the highlighted
 * selection (not selected), <f> is nonzero when the List has the focus.
 * <s> is the selected choise.
 * Note: <s> and <aa> are POSITIONS on the List, and are not the actual
 *       array elements.  To calculate these positions, subtract the top
 *       element visible on the List, and pass them to the routine.
 */
int ListD( int x, int y, int l, int aa, int s, int f );
