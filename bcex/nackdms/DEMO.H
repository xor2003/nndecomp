/* Header file for ACK-3D demo */
/* Author: Lary Myers	       */

/* This file descibes things specific to the demo application */

#define USE_SOUND   1	    /* Set to 1 to compile sound routines */

#define CLOCK_PTR   (*(long far *)((long)0x46C))

#define FP_SHIFT    16

typedef struct {
    int	    mdx;
    int	    mdy;
    int	    mButtons;
} MOUSE;

typedef struct {
    int	    xP;
    int	    yP;
    int	    Angle;
} VIEWERS;

#define KEYBD  0x9    /* INTERRUPT 9 */

/* Keyboard press and release codes for INT 9 handler */

#define RIGHT_ARROW_KEY	  77
#define UP_ARROW_KEY	  72
#define LEFT_ARROW_KEY	  75
#define DOWN_ARROW_KEY	  80
#define CONTROL_KEY	  29
#define ESCAPE_KEY	  1
#define HOME_KEY	  71
#define PGUP_KEY	  73
#define PGDN_KEY	  81
#define END_KEY		  79
#define PLUS_KEY	  78
#define MINUS_KEY	  74
#define LETTER_A_KEY	  30
#define LETTER_D_KEY	  32
#define LETTER_H_KEY	  35
#define LETTER_I_KEY	  23
#define LETTER_L_KEY	  38
#define LETTER_M_KEY	  50
#define LETTER_S_KEY	  31
#define SPACEBAR_KEY	  57
#define NUMBER_1_KEY	  2
#define NUMBER_2_KEY	  3
#define NUMBER_3_KEY	  4
#define ENTER_KEY	  28
#define F1_KEY		  59
#define F2_KEY		  60
#define F3_KEY		  61
#define F4_KEY		  62
#define F5_KEY		  63
#define F6_KEY		  64
#define F7_KEY		  65
#define F8_KEY		  66
#define F9_KEY		  67
#define F10_KEY		  68

#define DEF_STEPRATE	6

typedef struct {
	int	hx;
	int	hy;
	UINT far *Cursor;
} MCURSORS;

#define MOUSE_ARROW		0
#define MOUSE_UPARROW		1
#define MOUSE_DNARROW		2
#define MOUSE_LTARROW		3
#define MOUSE_RTARROW		4

#define WALL_DELAY		20	/* Interations to animate walls */

#define START_HOURS		1
#define START_MINUTES		59
#define START_SECONDS		59
#define TIME_DELAY		6

#define VIDEO_OFFSET		7080	/* Offset to start of viewport */
#define VIDEO_ROWS		125	/* Number of rows in viewport  */
#define VIDEO_COLS		238	/* Number of cols in viewport  */

#define VP_STARTX		40	/* Viewport coordinates */
#define VP_STARTY		22
#define VP_ENDX			278
#define VP_ENDY			150	/* Was 147 */

#define VP_LARROWX		115	/* Where mouse turns to left arrow */
#define VP_RARROWX		210	/* Where mouse turns to right arrow */
#define VP_UDARROWY		80	/* Where mouse turns up/down arrow */

#define VP_TIMEX		10	/* Where "time remaining" displays */
#define VP_TIMEY		191

#define VP_TEXTX		65
#define VP_TEXTY		24
#define VP_STATUSX		0
#define VP_STATUSY		187
#define VP_STATUSX1		319
#define VP_STATUSY1		199

#define VP_LIGHTBARX		82
#define VP_LIGHTBARY		158
#define VP_LIGHTBARX1		237
#define VP_LIGHTBARY1		163
#define VP_LIGHTBAR_OFFSET	50642
#define VP_LIGHTBAR_ROWS	6
#define VP_LIGHTBAR_COLS	155

#define MAX_INVENTORY		8	/* Max objects carried at one time */
#define OBJECT_COUNT		3

#define OBJ_CIRCUITBOARD	0
#define OBJ_FUELCELLS		1
#define OBJ_COMPUTER		2

typedef struct {
	int	x;
	int	y;
	char	*Text;
    } HOLOTEXT;

#define HT_TEXTX    140
#define HT_TEXTY    60



/***************************** Prototypes ********************************/
void mouse_hide_cursor(void);
void mouse_show_cursor(void);
int mouse_installed(void);
void mouse_read_cursor(int *,int *,int *);
void mouse_set_cursor(int,int);
void mouse_set_graphics_cursor(int hsrow,int hscol,char far *mask);
void ShowColor(UCHAR color);
int ReadMasterFile(char *fname);
void mouse_released(void);
void UnlockDoors(void);



