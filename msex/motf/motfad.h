/* Header for Motif add-ons */

/* Functions */

/* An Error Drawing (!) */
int ErrorDrawing( int x, int y );

/* An Information Symbol (i) */
int InfoDrawing( int x, int y );

/* Question Drawing (?) */
int QuestionDrawing( int x, int y );

/* Working Drawing (hourglass) */
int WorkingDrawing( int x, int y );

/* Draw and use an Information Dialog Box */
int InfoDialog( int x, int y, char *str, char *title );

/* Draw and use an Question Dialog Box */
int QuestionDialog( int x, int y, char *str, char *title );

/* Draw and use an Error Dialog Box */
int ErrorDialog( int x, int y, char *str, char *title );

/* Draw and use a FileSelectionDialog Box
 * Vars:
 * <x>,<y> = x,y coords of upper left corner of dialog box
 * <t> = title of Dialog Box
 * <filt> = initial filter
 * <f> = the file that the user specifies
 * <mx> = max number of characters in the filename (-1 says doesn't care)
 */
int FileSelectionDialog( int x, int y, char *t, char *filt, char *fi, int mx );

/* Find the files under <path>, store in <files> array. . .
 * <i> is max number of files
 */
int get_f( char *path, char files[][13], int i );

/* Find the directories (including parent) under <path>, store
 * in <files> array. . .
 * <i> is max number of directories
 */
int get_d( char *path, char files[][13], int i );

/* Add directory subdirectory <dir> to pathname <path>,
 * preserve filename.  Remember not to add a backslash ('\\')
 * to the end of <dir>
 */
int add_dir( char *path, char *dir );

/* Go to the parent directory of pathname <path>,
 * preserve filename
 */
int sub_dir( char *path );

/* Init FileSelectionDialog interface */
int init_fsd( int x,               /* X coord of upper left corner */
	      int y,               /* Y coord of upper left corner */
	      struct WI *w,        /* Window structure */
	      char *t,             /* Window title */
	      struct component c[],/* component struct array */
	      char *filt           /* filter string */
	    );

/* Put make a full path to <file> in <path>, place in <path> */
int file_path( char *file, char *path );
