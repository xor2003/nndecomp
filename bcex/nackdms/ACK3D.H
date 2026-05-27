/* Header file for ACK3D engine interface */
/* Author: Lary Myers */

typedef unsigned long	ULONG;
typedef unsigned int	UINT;
typedef unsigned char	UCHAR;

/*** Error codes returned from Ack... functions ***/
#define ERR_BADFILE	    100
#define ERR_BADCOMMAND	    101
#define ERR_BADOBJNUMBER    102
#define ERR_BADSYNTAX	    103
#define ERR_LOADINGBITMAP   104
#define ERR_BADDIRECTION    105
#define ERR_BADSTARTX	    106
#define ERR_BADSTARTY	    107
#define ERR_BADANGLE	    108
#define ERR_BADMAPFILE	    109
#define ERR_READINGMAP	    110
#define ERR_BADPICNAME	    111
#define ERR_INVALIDFORM	    112
#define ERR_NOPBM	    113
#define ERR_BADPICFILE	    114
#define ERR_NOMEMORY	    115
#define ERR_BADPALFILE	    116
#define ERR_BADWINDOWSIZE   117
#define ERR_TOMANYVIEWS	    118


#define INT_ANGLE_1	5
#define INT_ANGLE_2	10
#define INT_ANGLE_4	20
#define INT_ANGLE_6	30
#define INT_ANGLE_30	160
#define INT_ANGLE_45	240
#define INT_ANGLE_90	480
#define INT_ANGLE_135	720
#define INT_ANGLE_180	960
#define INT_ANGLE_225	1200
#define INT_ANGLE_270	1440
#define INT_ANGLE_315	1680
#define INT_ANGLE_360	1920

#define GRID_SIZE	64		    /* Size of each square */
#define GRID_WIDTH	64		    /* Map width */
#define GRID_HEIGHT	64		    /* Map height */
#define GRID_MAX	GRID_WIDTH * GRID_HEIGHT
#define GRID_XMAX	GRID_WIDTH * GRID_SIZE
#define GRID_YMAX	GRID_HEIGHT * GRID_SIZE
#define GRID_ARRAY	(GRID_WIDTH+2) * (GRID_HEIGHT+2)

#define MAX_WALLBMPS	256		    /* Total wall bitmaps allowed */
#define MAX_OBJBMPS	256		    /* Total obj bitmaps allowed  */

#define MAX_OBJECTS	254		    /* Total objects in map */

#define MAX_ZONES	8		    /* Number of light zones */
#define PAL_SIZE	4096		    /* Shading palette ranges */

#define MAX_VIEWS	47		    /* Total sides to an object */

#define DEFAULT_DOOR_SPEED  2
#define MAX_DOORS	    10	    /* Max opening or closing at one time  */

#define DOOR_TYPE_SECRET    0x8000
#define DOOR_LOCKED	    0x4000
#define DOOR_TYPE_SLIDE	    0x2000
#define DOOR_TYPE_SPLIT	    0x1000


#define DOOR_XCODE	    60		    /* Map codes for the various doors */
#define DOOR_SIDECODE	    61
#define DOOR_YCODE	    62

#define TYPE_WALL	0
#define TYPE_OBJECT	1

#define OF_PASSABLE	0x80		    /* Object can be walked thru */
#define OF_ANIMATE	0x40		    /* Object bitmaps are animated */

#define SHADING_ON	1		    /* Used in LightFlag */
#define SHADING_OFF	0

#define OBJECT_ACTIVE	1		    /* Active and may be moveable */
#define OBJECT_INACTIVE 0		    /* Won't be considered moveable */


#define POV_NOTHING	0		    /* Nothing was hit */
#define POV_XWALL	1		    /* An X wall was hit */
#define POV_YWALL	2		    /* A Y wall was hit */
#define POV_OBJECT	3		    /* An object was hit */
#define POV_PLAYER	4		    /* The player was hit by object */

#define POV_NODOOR	0		    /* No door was opened */
#define POV_XDOOR	1		    /* An X door was opened */
#define POV_YDOOR	2		    /* A Y door was opened */
#define POV_XSECRETDOOR 3		    /* An X secret door was opened */
#define POV_YSECRETDOOR 4		    /* A Y secret door was opened */

#define POV_DOORLOCKED	0x80		    /* Bit on if door is locked */

typedef struct {
	    char	Active;
	    UCHAR	bmNum[MAX_VIEWS];
	    int		Sides;
	    int		Dir;
	    UCHAR	Flags;
	    UCHAR	CurNum;
	    UCHAR	MaxNum;
	    char	Speed;
	    int		VidRow;
	    int		x;
	    int		y;
	    int		mPos;
} OBJECTS;


#define DOOR_OPENING	0x80		/* On if door is currently opening */
#define DOOR_CLOSING	0x40		/* On if door is currently closing */


typedef struct {
	    int	    mPos;
	    int	    mPos1;
	    UINT    mCode;
	    UINT    mCode1;
	    UCHAR   ColOffset;
	    char    Speed;
	    char    Type;
	    UCHAR   Flags;
} DOORS;

typedef struct {

	    UINT    far xGrid[GRID_ARRAY];  /* Map for X walls */
	    UINT    far yGrid[GRID_ARRAY];  /* Map for Y walls */

	    UCHAR   far *bMaps[MAX_WALLBMPS]; /* Pointers to wall bitmaps */
	    UCHAR   far *oMaps[MAX_OBJBMPS];  /* Pointers to object bitmaps */

	    UCHAR   far *ScreenBuffer;	    /* 64k buffer for screen */
	    UCHAR   far *OverlayBuffer;	    /* Buffer for compiled overlay */
	    UCHAR   far *BkgdBuffer;	    /* Buffer for ceiling,floor */

	    int		xPlayer;	    /* X value from 0 to 4095 */
	    int		yPlayer;	    /* Y value from 0 to 4095 */
	    int		PlayerAngle;	    /* Angle value from 0 to 1919 */

	    int		DoorSpeed;	    /* Door open/close speed */
	    int		NonSecretCode;	    /* Wall code for secret door */

	    UCHAR	TopColor;	    /* Base color of ceiling */
	    UCHAR	BottomColor;	    /* Base color of floor */

	    UCHAR	LightFlag;	    /* 0 = no light shading, 1 = ON */
	    UCHAR	PalTable[PAL_SIZE]; /* 16 solid colors, 32 zones */

	    int		WinStartX;	    /* Value of left side of viewport */
	    int		WinStartY;	    /* Value of top side of viewport */
	    int		WinEndX;	    /* Value of right side */
	    int		WinEndY;	    /* Value of bottom side */
	    int		CenterRow;	    /* Value of (WinEndY-WinStartY)/2 */
	    int		WinWidth;	    /* Value of WinEndX - WinStartX */
	    int		WinHeight;	    /* Value of WinEndY - WinStartY */
	    UINT	WinLength;	    /* Number of dwords in window */
	    UINT	WinStartOffset;	    /* Value of WinStartY * 320 */

	    int		MaxObjects;	    /* Total objects in map */
	    OBJECTS	ObjList[MAX_OBJECTS+1]; /* Current objects in map */
	    DOORS	Door[MAX_DOORS];    /* Doors moving at one time */
} ACKENG;


/******* Prototypes *********/

int AckInitialize(ACKENG *ae);
/* Reads trig files, builds wall and object maps, general initialize */
/* Also sets up distance table */

int AckReadMapFile(ACKENG *ae,char *MapFileName);
/* Reads map file and setups map grids */

int AckLoadBitmap(ACKENG *ae,int BitmapNumber,int BitmapType,char *bmFileName);
/* Loads a bitmap and places in either bMaps or oMaps based on bmType */

UCHAR far *AckReadiff(char *FileName);
/* Reads in a .LBM or .BBM file and returns a buffer */

int AckLoadAndSetPalette(char *FileName);
/* Reads in a palette file and sets the screen palette */

void AckSetPalette(UCHAR far *PalBuffer);
/* Sets a previously loaded palette */

int AckLoadWall(ACKENG *ae,int WallNumber,char *bmFileName);
/* Loads a wall bitmap and places it into the wall array */

int AckLoadObject(ACKENG *ae,int BmpNumber,char *bmFileName);
/* Loads an object bitmap and places it into the object array */

int AckCreateObject(ACKENG *ae,int ObjNumber,int NumBitmaps,UCHAR *bmNums);
/* Fills in ObjList structure with information passed */

int AckCreateOverlay(ACKENG *ae, UCHAR far *OverlayScreen);
/* Reads overlay file and compiles into OverlayBuffer */

int AckBuildBackground(ACKENG *ae);
/* Builds background buffer from TopColor, BottomColor, and LightFlag */

void AckSetVGAmode(void);
/* Places video in standard 320x200 mode 13h */

void AckSetTextmode(void);
/* Places video in 80x25 color text mode 3 */

void AckFadeIn(int Begin,int Count,UCHAR far *Palette);
/* Fades the screen in from black to the supplied palette */

void AckFadeOut(int Begin,int Count);
/* Fades the screen from current palette to black */

int AckBuildView(ACKENG *ae);
/* Draws the current view into ScreenBuffer */

void AckDrawOverlay(UCHAR far *Screen,UCHAR far *Overlay);
/* Places the overlay graphics on top of the screen */

int AckDisplayScreen(ACKENG *ae);
/* Displays the contents of ScreenBuffer and OverlayBuffer if desired */

int AckCheckHit(int xPlayer,int yPlayer,int ViewAngle,ACKENG *ae);
/* Checks if a collision occurs */

int AckCheckDoorOpen(int xPlayer,int yPlayer,int PlayerAngle,ACKENG *ae);
/* Check if a door in front to open */

int AckCheckObjPosn(ACKENG *ae,int xPlayer,int yPlayer,int PlayerAngle);
/* Used by AckMovePOV() and AckMoveObjectPOV() to check collision with objects */

void AckCheckObjectMovement(ACKENG *ae);
/* Runs the list of objects to check movement */

int AckMovePOV(ACKENG *ae,int Angle,int Amount);
/* Moves the POV by the specified amount at the specified angle */

int AckMoveObjectPOV(ACKENG *ae,int ObjIndex,int Angle,int Amount);
/* Moves the object POV by the specified amount at the specified angle */

int AckGetObjectHit(void);
/* Returns the object index number of the last object hit */

int AckGetWallHit(void);
/* Returns the map location of the last wall hit */

int AckDeleteObject(ACKENG *ae,int ObjectIndex);
/* Removes the specified object from the map */

void AckReplaceBitmap(UINT far *xGrid,UINT far *yGrid,UCHAR OldBmp,UCHAR NewBmp);
/* Runs through the map and replaces old bitmaps with new bitmaps */

void AckOverlayBitmap(UCHAR far *destination,UCHAR far *source);
/* Copies non-transparent colors from source onto destination bitmap */

UCHAR far *AckCopyNewBitmap(UCHAR far *OldBitmap);
/* Creates a new bitmap buffer and copies OldBitmap into it */

UCHAR far *AckGetBitmapPtr(int BitmapNumber,UCHAR far **Maps);
/* Returns a real memory pointer to the specified bitmap */

int AckSetNewBitmapPtr(int BitmapNumber,UCHAR far **Maps,UCHAR far *NewBitmap);
/* Sets a new or changes image into the bitmap array */

int AckFreeBitmap(UCHAR far *Bmp);
/* Frees up the memory used by the bitmap */

int AckWrapUp(ACKENG *ae);
/* Frees memory buffers */

