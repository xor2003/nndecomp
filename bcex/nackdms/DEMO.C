/*********************( Animation Construction Kit Demo )**********************/
/*				Lary Myers				      */
/*									      */
/*  Okay, don't laugh, this program started out to be a tutorial on using the */
/* functions in the ACK3D library but then grew and grew, and grew! Now it's  */
/* a coalage of routines, experiments, half-wit ideas, etc. I think what I    */
/* wanted to do was see if the engine itself could be used in a large scale   */
/* game. While Station Escape doesn't come close to commercial (or even       */
/* shareware) quality, it does demonstrate that the engine can be used to     */
/* produce something other than quick demo's. You are welcome to hack away    */
/* at this code, or toss it completely and start anew. I'm putting this into  */
/* the public domain "as-is" for everyone to share. Maybe it will spark some  */
/* ideas for other games that then go on to be BIG sellers! If so, then I     */
/* will be pleased to know that I helped in some way towards new games.	      */
/*									      */
/* Thank You for looking at the ACK demonstration and engine.		      */
/*									      */
/* Lary Myers CIS account 72355,655					      */
/*****************************<	  ACK-3D   >***********************************/
#include <stdlib.h>
#include <stdio.h>
#include <dos.h>
#include <mem.h>
#include <alloc.h>
#include <io.h>
#include <fcntl.h>
#include <time.h>
#include <string.h>
#include <conio.h>
#include <ctype.h>
#include <sys\stat.h>
#include "ack3d.h"
#include "acksnd.h"
#include "demo.h"

/* Variables in the DEMORD.C module */
extern	    char		GridFile[];
extern	    char		PalFile[];
extern	    int			ErrorCode;


/****** G L O B A L S ******************************/
	    ACKENG		*ae;		/* The main interface struct */
	    MOUSE		mouse;
	    UCHAR		scanCode;
	    UCHAR		Keys[128];
	    int			HaveMouse;
	    int			SoundDevice;	/* Selected from command line */
	    int			Shooting;
	    int			BoltEnergy;
	    int			Decompress;
	    int			MouseMode;	/* 0 = UW2 style, 1 = Wolf style */
	    int			LockedFlag;
	    int			TotalInventory;
	    int			InventoryFlag;
	    int			HoloSoundFlag;
	    int			YouWON;
	    VIEWERS		Views[] = {
				 96,96,INT_ANGLE_90,
				 96,96,0,
				 96,96,INT_ANGLE_90
				 };

	    void		interrupt (*oldvec)();
	    void		interrupt myInt();

	    void		interrupt (*OldTimer)();
	    void		interrupt MyTimer();


	    UCHAR		nums[] = {1,2,3,4,5,6,7,8};
	    UCHAR		snums[] = {17,17,18,18,19,19,20,20,20,20,
					   19,19,18,18,17,17,17,17,17,17,
					   17,17,17,17,17,17,17,17};
	    UCHAR		bnums[] = {9,9,9,10,10,11,12,13,14,15,16,
					   11,10,9,9,9,9,9,9,9,9,9,9,9,
					   9,9,9,9,9,9,9,9,9,9,9,9,9,9};

	    char		Path[] = "bitmaps\\";
	    UINT		VidOffset;

	    char		tmHours;
	    char		tmMinutes;
	    char		tmSeconds;
	    int			tmDelay;
	    int			tmCounter;
	    int			LastMouseIndex;

	    int			OldWall;
	    int			NewWall;
	    int			WallDelay;
	    UCHAR		WallType[] = {2,3,4};
	    UCHAR		WallType1[] = {11,12,13,14};
	    UCHAR		WallType2[] = {7,8};
	    UCHAR		WallType3[] = {9,10};
	    UCHAR		WallType4[] = {28,29};

	    UCHAR		HoloWalls[] = {41,44,45,45};

	    UCHAR		Inventory[MAX_INVENTORY+1];

	    int			SpaceMenDelay[21];

	    int			WallIndex;
	    int			WallIndex1;
	    int			WallIndex2;
	    int			WallIndex3;
	    int			WallIndex4;
	    int			HoloIndex;
	    UCHAR	   far	*wMaps[3];
	    UCHAR	   far	*wMaps1[4];
	    UCHAR	   far	*wMaps2[2];
	    UCHAR	   far	*wMaps3[2];
	    UCHAR	   far	*wMaps4[2];

	    UCHAR	   far	*hMaps[4];

/***** Mouse cursor bitmaps ******/
	    unsigned		Arrow[32] = {
				 0x3fff,0x1fff,0xfff,0x7ff,0x3ff,0x1ff,0xff,0x7f,
				 0x3f,0x1f,0xf,0x7,0x1847,0x387f,0xfc3f,0xfe7f,
				 0x0,0x4000,0x6000,0x7000,0x7800,0x7c00,0x7e00,0x7f00,
				 0x7f80,0x7fc0,0x7fe0,0x6730,0x4300,0x300,0x180,0x0};


	    unsigned		UpArrow[32] = {
				 0xfeff,0xfc7f,0xf83f,0xf01f,0xe00f,0xc007,0xc007,0xc007,
				 0xc007,0xc827,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,
				 0x0,0x100,0x380,0x7c0,0xfe0,0x1ff0,0x1ff0,0x1bb0,
				 0x1390,0x380,0x380,0x380,0x380,0x380,0x380,0x0};

	    unsigned		DownArrow[32] = {
				 0xffff,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,0xc827,
				 0xc007,0xc007,0xc007,0xe00f,0xf01f,0xf83f,0xfc7f,0xfeff,
				 0x0,0x0,0x380,0x380,0x380,0x380,0x380,0x380,
				 0x1390,0x1bb0,0x1ff0,0xfe0,0x7c0,0x380,0x100,0x0};

	    unsigned		LeftArrow[32] = {
				 0xffff,0xf7ff,0xe3ff,0xc0ff,0x807f,0x3f,0x801f,0xc01f,
				 0xe01f,0xf41f,0xfc1f,0xfc1f,0xfc1f,0xfc1f,0xfc1f,0xfc1f,
				 0x0,0x0,0x800,0x1800,0x3f00,0x7f80,0x3fc0,0x19c0,
				 0x9c0,0x1c0,0x1c0,0x1c0,0x1c0,0x1c0,0x1c0,0x0};

	    unsigned		RightArrow[32] = {
				 0xffff,0xffef,0xffc7,0xff03,0xfe01,0xfc00,0xf801,0xf803,
				 0xf807,0xf82f,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,0xf83f,
				 0x0,0x0,0x10,0x18,0xfc,0x1fe,0x3fc,0x398,
				 0x390,0x380,0x380,0x380,0x380,0x380,0x380,0x0};

	    MCURSORS		mCursors[] = {
				 1,0,Arrow,
				 7,0,UpArrow,
				 7,15,DownArrow,
				 0,5,LeftArrow,
				 7,5,RightArrow
				 };


	    char	    far *SoundFiles[SOUND_MAX_INDEX+1];

	    char		MusicFile[60];

	    UCHAR		FontTransparent;
	    UCHAR		FontColor;
	    UCHAR		TextBGcolor;
	    UCHAR	    far *smFont;
	    UCHAR	    far *CompassBmp;


	    char		*ObjectText[] = {
				"Circuit Board....",
				"Fuel Cells.......",
				"Computer........."
				};

	    char		ObjectList[OBJECT_COUNT+1];


	    HOLOTEXT		HoloText[] = {
				HT_TEXTX,HT_TEXTY,"No program",
				HT_TEXTX,HT_TEXTY+10,"Program 1",
				HT_TEXTX,HT_TEXTY+20,"Program 2",
				-1,-1,0
				};



/****************************************************************************
** Here we load a specific DP2 brush that we'll use as our display font.   **
**									   **
****************************************************************************/
int LoadSmallFont(void)
{
    int	    ht,wt,len;

smFont = AckReadiff("bitmaps\\spfont.bbm");
if (smFont == NULL)
    return(-1);

ht = (*(int *)smFont);
wt = (*(int *)&smFont[2]);
len = ht * wt;
memmove(smFont,&smFont[4],len);

return(0);
}

/****************************************************************************
** Displays a character either directly on the video, or into the screen   **
** buffer depending on whether FontTransparent flag is set.		   **
**									   **
****************************************************************************/
void smWriteChar(int x,int y,unsigned char ch)
{
		int	 FontOffset,VidOffset;
		int	 row,col;
    unsigned	char far *Video;

VidOffset = (y * 320) + x;
Video = MK_FP(0xA000,VidOffset);

FontOffset = ((ch-32) * 5);

if (FontTransparent)
    Video = ae->ScreenBuffer + VidOffset;

for (row = 0; row < 5; row++)
    {
    if (!FontTransparent)
	memset(Video,TextBGcolor,4);

    if (smFont[FontOffset])
	Video[0] = FontColor;
    if (smFont[FontOffset+1])
	Video[1] = FontColor;
    if (smFont[FontOffset+2])
	Video[2] = FontColor;
    if (smFont[FontOffset+3])
	Video[3] = FontColor;

    Video += 320;
    FontOffset += 294;
    }


}

/****************************************************************************
** Calls smWriteChar() to display the contents of the passed string. Only  **
** crude string handling is done in this routine.			   **
**									   **
****************************************************************************/
int smWriteString(int x,int y,char *s)
{
    int	    OrgX;
    char    ch;

OrgX = x;

mouse_hide_cursor();
while (*s)
    {
    ch = *s++;

    if (ch == 10)	/* If a linefeed then advance to next row */
	{
	x = OrgX;
	y += 8;
	continue;
	}

    if (ch < ' ')
	continue;

    ch = toupper(ch);
    smWriteChar(x,y,ch);
    x += 5;		/* Advance to next character position */
    }
mouse_show_cursor();

return(y);
}

/****************************************************************************
** Sets the transparent flag and then calls smWriteString() to place the   **
** string into the system buffer. This routine is called after the walls   **
** are drawn so the text appears to float on top of the walls.		   **
****************************************************************************/
void smWriteHUD(int x,int y,UCHAR color,char *s)
{
FontTransparent = 1;
FontColor = color;
smWriteString(x,y,s);
FontTransparent = 0;
FontColor = 15;
}

/****************************************************************************
** Just a quick menu pick list to allow the player to select the desired   **
** holodeck program to run.						   **
**									   **
****************************************************************************/
int PickHoloProgram(void)
{
	int	i,mx,my,mbutton;
	int	prognum,x,x1,y;
	UCHAR	hColor;

mouse_hide_cursor();
hColor = 14;
i = 0;
while (1)
    {
    if (HoloText[i].x == -1)
	break;
    smWriteHUD(HoloText[i].x,HoloText[i].y,hColor,HoloText[i].Text);
    i++;
    }

AckDisplayScreen(ae);

mouse_show_cursor();
if (MouseMode)
    mouse_show_cursor();

prognum = -2;

while (prognum == -2)
    {
    mouse_read_cursor(&mbutton,&my,&mx);

    if (mbutton & 2)
	{
	prognum = -1;
	break;
	}

    if (mbutton & 1)
	{
	i = 0;
	while (1)
	    {
	    x = HoloText[i].x;
	    if (x == -1)
		break;

	    y = HoloText[i].y;
	    x1 = (strlen(HoloText[i].Text) * 5) + x;

	    if (mx >= x && mx <= x1 && my >= y && my <= (y+5))
		{
		prognum = i;
		break;
		}
	    i++;
	    }
	}
    }

if (MouseMode)
    mouse_hide_cursor();

return(prognum);
}


/****************************************************************************
** Builds the appropriate strings from the inventory array and displays	   **
** them on top of the current walls.					   **
**									   **
****************************************************************************/
void ShowInventory(void)
{
    int	    i,row;
    char    mBuf[30];

smWriteHUD(VP_TEXTX,VP_TEXTY,2,"Inventory:");
row = 10;

for (i = 0; i < OBJECT_COUNT; i++)
    {
    strcpy(mBuf,ObjectText[i]);
    if (ObjectList[i] != 1)
	strcat(mBuf,"No");
    else
	strcat(mBuf,"Yes");

    smWriteHUD(VP_TEXTX,VP_TEXTY+row,2,mBuf);
    row += 10;
    }

/* Debug line to show how much memory the system has left */

sprintf(mBuf,"Memory.........%dK",farcoreleft()/1024L);
smWriteHUD(VP_TEXTX,VP_TEXTY+row,2,mBuf);

}


/****************************************************************************
** Displays the contents of the specified text file onto the viewport	   **
** window.								   **
**									   **
****************************************************************************/
void ShowTextFile(char *fName)
{
    int	    x,y;
    char    buf[80];
    FILE    *fp;

fp = fopen(fName,"rt");
if (fp == NULL)
    return;

x = VP_TEXTX;
y = VP_TEXTY;

mouse_hide_cursor();
ShowColor(7);

while (1)
    {
    if (feof(fp))
	break;

    *buf = '\0';
    fgets(buf,78,fp);

    y = smWriteString(x,y,buf);

    }

mouse_show_cursor();

fclose(fp);
}



/****************************************************************************
** Changes the shape of the mouse cursor when in UW2 mode.		   **
**									   **
****************************************************************************/
void SetMouseCursor(int index)
{

mouse_set_graphics_cursor(mCursors[index].hy,
			  mCursors[index].hx,
			  (UCHAR far *)mCursors[index].Cursor);

}


/****************************************************************************
** Keyboard interrupt 9							   **
****************************************************************************/
void interrupt myInt(void)
{
  register char x;

scanCode = inp(0x60); // read keyboard data port
x = inp(0x61);
outp(0x61, (x | 0x80));
outp(0x61, x);
outp(0x20, 0x20);

Keys[scanCode & 127] = 1;
if (scanCode & 128)
    Keys[scanCode & 127] = 0;

}

/****************************************************************************
** Our timer countdown routine. For game time we are counting down faster  **
** than real time (adds to the suspense?).				   **
**									   **
****************************************************************************/
void interrupt MyTimer(void)
{

tmCounter++;

if (tmSeconds == 0 &&
    tmMinutes == 0 &&
    tmHours == 0)
    return;

tmDelay--;

if (!tmDelay)
    {
    tmDelay = TIME_DELAY;
    tmSeconds--;
    if (tmSeconds < 0)
	{
	tmSeconds = 59;
	tmMinutes--;
	if (tmMinutes < 0)
	    {
	    if (tmHours)
		{
		tmHours--;
		tmMinutes = 59;
		}
	    else
		tmMinutes = tmSeconds = 0;
	    }
	}
    }
}

/****************************************************************************
** Routine currently not used. This allows the Wolf style mouse actions	   **
** It is called once during InitializeMouse()				   **
****************************************************************************/
void CheckMouse(MOUSE *m)
{
    int	    dx,dy;
    int	    x,y,buttons;


if (HaveMouse)
    {
    mouse_read_cursor(&buttons,&y,&x);
    dx = x - 160;
    dy = y - 120;
    m->mButtons = buttons;
    mouse_set_cursor(120,160);

    if (abs(dy) > 10 && abs(dx) < 32)
	dx >>= 2;

    m->mdx = dx;
    m->mdy = dy;

    }

}

/****************************************************************************
** Determines if the mouse is present.					   **
**									   **
****************************************************************************/
int InitializeMouse(void)
{

memset(&mouse,0,sizeof(MOUSE));
HaveMouse = 0;
if (mouse_installed() == -1)
    {
    HaveMouse = 1;
    CheckMouse(&mouse);
    }

return(HaveMouse);
}

/****************************************************************************
** This routine simply runs through the video and replaces any old colors  **
** with a new color. Good for special effects when text is being displayed **
**									   **
****************************************************************************/
void ReplaceColor(UCHAR OldColor,UCHAR NewColor)
{
    int	    rows,cols;
    UCHAR   far *Video;

Video = MK_FP(0xA000,VIDEO_OFFSET);

for (rows = 0; rows < VIDEO_ROWS; rows++)
    {
    for (cols = 0; cols < VIDEO_COLS; cols++)
	{
	if (Video[cols] == OldColor)
	    Video[cols] = NewColor;

	}
    Video += 320;
    }

}

/****************************************************************************
** Essentially a clear screen buffer to the specified color. Allows setting**
** the background color that appears in the viewport window when text is   **
** being displayed.							   **
****************************************************************************/
void ShowColor(UCHAR color)
{

memset(ae->ScreenBuffer,color,64000);
AckDrawOverlay(ae->ScreenBuffer,ae->OverlayBuffer);
AckDisplayScreen(ae);

}


/* This is actually in the ACK engine lib */
extern UINT  far *Grid;

/****************************************************************************
** Displays an overhead map of the entire station. This routine relies on  **
** external variables in the ACK engine and is kind of a cheat from the	   **
** proper way of keeping the application isolated from the engine.	   **
**									   **
****************************************************************************/
void ShowOverhead(void)
{
    int	    row,col,mPos,offset;
    int	    MidRow,MidCol,MidOffset;
    int	    mx,my,mbuttons,gCode;
    UCHAR   Color;
    UCHAR   far *Video;


mouse_hide_cursor();
ShowColor(7);

mx = VP_STARTX + (((VP_ENDX - VP_STARTX) - 128) / 2);

my = VP_STARTY + (((VP_ENDY - VP_STARTY) - 64) / 2);

Video = MK_FP(0xA000,(my * 320) + mx);


MidRow = ae->yPlayer >> 6;
MidCol = ae->xPlayer >> 6;

for (row = 0; row < GRID_HEIGHT; row++)
    {
    offset = 0;
    for (col = 0; col < GRID_WIDTH; col++)
	{
	mPos = (row << 6) + col;

	gCode = Grid[mPos];

	switch (gCode & 0xFF)
	    {
	    case 0:
		Color = 0;
		break;

	    case DOOR_XCODE:
	    case DOOR_YCODE:
		Color = 9;
		break;

	    default:
		Color = 15;
		if (gCode & 0x80)
		    Color = 12;
		break;
	    }

	if (gCode & DOOR_TYPE_SECRET)
	    Color = 11;


	if (row == MidRow && col == MidCol)
	    {
	    Color = 12;
	    MidOffset = FP_OFF(Video) + offset;
	    }

	Video[offset] = Color;
	Video[offset+1] = Color;

	offset += 2;
	}

    Video += 320;
    }

Video = MK_FP(0xA000,MidOffset);

mouse_show_cursor();
mouse_released();

mPos = 0;
row = 500;

while (1)
    {
    mouse_read_cursor(&mbuttons,&my,&mx);

    if (mbuttons & 1)
	break;

    if (Keys[ENTER_KEY])
	break;

    row--;
    if (!row)
	{
	Video[0] = mPos;
	Video[1] = mPos;
	mPos ^= 12;
	if (mPos)
	    row = 100;
	else
	    row = 500;
	}
    }

mouse_released();

}

/****************************************************************************
** Pauses here until mouse button is released				   **
****************************************************************************/
void mouse_released(void)
{
    int	    mbutton,mx,my;

mouse_read_cursor(&mbutton,&my,&mx);
while (mbutton)
    mouse_read_cursor(&mbutton,&my,&mx);

}


/****************************************************************************
** Checks the location of the mouse to see if the mouse cursor needs to	   **
** change shape (used in UW2 mode).					   **
**									   **
****************************************************************************/
void CheckMouseCursor(int x,int y)
{
    int	    index;

index = 0;

if (y >= VP_STARTY && y <= VP_ENDY && x >= VP_STARTX && x <= VP_ENDX)
    {

    if (x < VP_LARROWX)
	index = MOUSE_LTARROW;

    if (x > VP_RARROWX)
	index = MOUSE_RTARROW;

    if (x >= VP_LARROWX && x <= VP_RARROWX)
	{
	if (y < VP_UDARROWY)
	    index = MOUSE_UPARROW;
	else
	    index = MOUSE_DNARROW;
	}

    }


if (index != LastMouseIndex)
    {
    SetMouseCursor(index);
    LastMouseIndex = index;
    }

}

/****************************************************************************
** Update all the walls as needed.					   **
****************************************************************************/
void AnimateWalls(void)
{
    int	    i;

ae->bMaps[WallType[0]] = wMaps[WallIndex];
WallIndex++;
if (WallIndex > 2)
    WallIndex = 0;

WallDelay--;
if (WallDelay)
    return;

WallDelay = WALL_DELAY;

ae->bMaps[WallType1[0]] = wMaps1[WallIndex1];

WallIndex1++;
if (WallIndex1 > 3)
    WallIndex1 = 0;

ae->bMaps[WallType2[0]] = wMaps2[WallIndex2];
WallIndex2++;
if (WallIndex2 > 1)
    WallIndex2 = 0;

ae->bMaps[WallType3[0]] = wMaps3[WallIndex3];
WallIndex3++;
if (WallIndex3 > 1)
    WallIndex3 = 0;

ae->bMaps[WallType4[0]] = wMaps4[WallIndex4];
WallIndex4++;
if (WallIndex4 > 1)
    WallIndex4 = 0;

}

/****************************************************************************
** Setup pointers to animated wall bitmaps				   **
****************************************************************************/
void SetupAnimatedWalls(void)
{
    int	    i;

for (i = 0; i < 3; i++)
    wMaps[i] = ae->bMaps[WallType[i]];

for (i = 0; i < 4; i++)
    wMaps1[i] = ae->bMaps[WallType1[i]];

for (i = 0; i < 2; i++)
    wMaps2[i] = ae->bMaps[WallType2[i]];

for (i = 0; i < 2; i++)
    wMaps3[i] = ae->bMaps[WallType3[i]];

for (i = 0; i < 2; i++)
    wMaps4[i] = ae->bMaps[WallType4[i]];

for (i = 0; i < 4; i++)
    hMaps[i] = ae->bMaps[HoloWalls[i]];

WallIndex = 1;
WallIndex1 = 1;
WallIndex2 = 1;
WallIndex3 = 1;
WallIndex4 = 1;
HoloIndex = 0;

}


/****************************************************************************
** Display the time remaining to the player.				   **
****************************************************************************/
void ShowTime(void)
{
    char    buf[48];

sprintf(buf,"Time remaining: %02d:%02d:%02d",tmHours,tmMinutes,tmSeconds);
smWriteString(VP_TIMEX,VP_TIMEY,buf);

}

/****************************************************************************
** Clears the statusline section at the bottom of the screen to the color  **
** specified.								   **
**									   **
****************************************************************************/
void ClearStatusLine(UCHAR color)
{
    int		rows,cols;
    UCHAR   far *Video;

rows = (VP_STATUSY * 320) + VP_STATUSX;
Video = MK_FP(0xA000,rows);

cols = (VP_STATUSX1 - VP_STATUSX) + 1;

for (rows = VP_STATUSY; rows < VP_STATUSY1; rows++)
    {
    memset(Video,color,cols);
    Video += 320;
    }

}

/****************************************************************************
** Displays the energy bar underneath the viewport.			   **
**									   **
****************************************************************************/
void ShowLightbar(void)
{
    int		row,col1,col2;
    UCHAR   far *Video;

Video = MK_FP(0xA000,VP_LIGHTBAR_OFFSET);

if (BoltEnergy < 0)
    BoltEnergy = 0;

col1 = BoltEnergy * 2;

if (col1 >= VP_LIGHTBAR_COLS)
    col1 = VP_LIGHTBAR_COLS - 1;

col2 = (VP_LIGHTBAR_COLS - col1) - 1;

if (col2)
    col2++;
else
    col1++;

for (row = 0; row < VP_LIGHTBAR_ROWS; row++)
    {
    if (col1)
	memset(Video,2,col1);
    if (col2)
	memset(&Video[col1],4,col2);
    Video += 320;
    }

}

/****************************************************************************
** Makes a call into the library to play the specified sound effect.	   **
**									   **
****************************************************************************/
void AppPlaySound(int VocIndex)
{
#if USE_SOUND
    AckPlaySound(VocIndex);
#else
    VocIndex--;	    /* Keep compiler happy */
#endif
}

/****************************************************************************
** Check for objects hit and take the appropriate action. This routine is  **
** called when the player moves and strikes something.			   **
****************************************************************************/
void CheckOurObjects(void)
{
    int	    i;

i = AckGetObjectHit();	/* Get index to object */

switch(i)
    {
    case 1:
    case 2:
    case 29:
	AppPlaySound(SOUND_HITBADOBJECT);
	if (BoltEnergy)
	    BoltEnergy--;
	ShowLightbar();
	break;

    case 10:
    case 39:
	AppPlaySound(SOUND_HITOBJECT);
	BoltEnergy += 30;
	if (BoltEnergy > 77) BoltEnergy = 77;

	ShowLightbar();
	AckDeleteObject(ae,i);
	break;

    case 8:
    case 9:
    case 25:
    case 27:
	AppPlaySound(SOUND_HITOBJECT);
	if (i == 25 && ObjectList[OBJ_COMPUTER] == 2)
	    break;

	if (i == 27 && ObjectList[OBJ_FUELCELLS] == 2)
	    break;

	if (TotalInventory < MAX_INVENTORY)
	    {
	    AckDeleteObject(ae,i);
	    Inventory[TotalInventory++] = i;
	    if (i == 25)
		ObjectList[OBJ_COMPUTER] = 1;

	    if (i == 27)
		ObjectList[OBJ_FUELCELLS] = 1;
	    }
	break;

    case 26:
	AppPlaySound(SOUND_HITOBJECT);
	if (ObjectList[OBJ_CIRCUITBOARD] == 2)
	    break;

	if (TotalInventory < MAX_INVENTORY)
	    {
	    AckDeleteObject(ae,26);
	    UnlockDoors();
	    Inventory[TotalInventory++]= 26;
	    ObjectList[OBJ_CIRCUITBOARD] = 1;
	    }
	break;

    default:
	if (i < 50)
	    AppPlaySound(SOUND_HITOBJECT);
	break;

    }

}

/****************************************************************************
** This routine will unlock ALL doors in the map			   **
****************************************************************************/
void UnlockDoors(void)
{
    int	    i;

for (i = 0; i < GRID_MAX; i++)
    {
    if (ae->xGrid[i] & DOOR_LOCKED)
	ae->xGrid[i] &= ~DOOR_LOCKED;

    if (ae->yGrid[i] & DOOR_LOCKED)
	ae->yGrid[i] &= ~DOOR_LOCKED;
    }


}



/****************************************************************************
** Check for doors opening or closing and play the appropriate sound.	   **
**									   **
****************************************************************************/
void PlayDoorSounds(void)
{
    int	    i,DoorColumn;

for (i = 0; i < MAX_DOORS; i++)
    {
    if (ae->Door[i].ColOffset)
	{
	DoorColumn = 64;
	if (ae->Door[i].mCode & DOOR_TYPE_SPLIT)
	    DoorColumn = 32;

	if (ae->Door[i].ColOffset < DoorColumn)
	    {
	    if (ae->Door[i].Flags & DOOR_OPENING)
		{
		AppPlaySound(SOUND_DOOROPENING);
		ae->Door[i].Flags &= ~DOOR_OPENING;
		}

	    if (ae->Door[i].Flags & DOOR_CLOSING)
		{
		AppPlaySound(SOUND_DOORCLOSING);
		ae->Door[i].Flags &= ~DOOR_CLOSING;
		}
	    }
	}
    }

}


/****************************************************************************
** Move the energy bolt and check for collision with walls or objects.	   **
** If a wall is hit then display damage, if a porthole is hit then the	   **
** station decompresses and the player loses.				   **
**									   **
****************************************************************************/
void UpdateBomb(void)
{
    int	    oNum,j,wCode,bCode,NewCode;
    int	    hFlag;

oNum = MAX_OBJECTS-1;
wCode = 0;
hFlag = 0;

j = AckMoveObjectPOV(ae,oNum,ae->ObjList[oNum].Dir,ae->ObjList[oNum].Speed);

if (j != POV_NOTHING && j != POV_PLAYER)
    {
    ae->ObjList[oNum].Active = 0;
    Shooting = 0;
    oNum = AckGetWallHit();

    if (j == POV_XWALL)
	{
	AppPlaySound(SOUND_EXPLODE);
	wCode = ae->xGrid[oNum] & 0xFF;

	bCode = wCode & 0x3F;

	if (bCode == 25)
	    ae->ObjList[MAX_OBJECTS-2].Active = 0;

	if (bCode >= WallType1[0] && bCode <= WallType1[3])
	    Decompress = 1;

	if (bCode > 21 && bCode < 25)
	    Decompress = 1;

	if (bCode == HoloWalls[0] || bCode == HoloWalls[1])
	    hFlag = 1;

	if (bCode < DOOR_XCODE && !hFlag)
	    {
	    bCode = wCode | 0x80;
	    NewCode = 57;

	    if (wCode == bCode)
		{
		bCode |= 0xC0;
		NewCode = 56;
		}

	    if (ae->bMaps[bCode] == NULL)
		{
		ae->bMaps[bCode] = AckCopyNewBitmap(ae->bMaps[wCode]);
		if (ae->bMaps[bCode] != NULL)
		    AckOverlayBitmap(ae->bMaps[bCode],ae->bMaps[NewCode]);
		}

	    if (ae->bMaps[bCode] != NULL)
		ae->xGrid[oNum] = bCode;

	    }

	}

    if (j == POV_YWALL)
	{
	AppPlaySound(SOUND_EXPLODE);
	wCode = ae->yGrid[oNum] & 0xFF;
	bCode = wCode & 0x3F;

	if (bCode == 25)
	    ae->ObjList[MAX_OBJECTS-2].Active = 0;

	if (bCode >= WallType1[0] && bCode <= WallType1[3])
	    Decompress = 1;

	if (bCode == HoloWalls[0] || bCode == HoloWalls[1])
	    hFlag = 1;

	if (bCode < DOOR_XCODE && !hFlag)
	    {
	    bCode = wCode | 0x80;
	    NewCode = 57;

	    if (wCode == bCode)
		{
		bCode |= 0xC0;
		NewCode = 56;
		}
	    if (ae->bMaps[bCode] == NULL)
		{
		ae->bMaps[bCode] = AckCopyNewBitmap(ae->bMaps[wCode]);
		if (ae->bMaps[bCode] != NULL)
		    AckOverlayBitmap(ae->bMaps[bCode],ae->bMaps[NewCode]);
		}


	    if (ae->bMaps[bCode] != NULL)
		ae->yGrid[oNum] = bCode;

	    }

	}

    if (j == POV_OBJECT)
	{
	oNum = AckGetObjectHit();
	if (oNum >= 50 && oNum < 70)
	    {
	    if (ae->ObjList[oNum].Flags & OF_ANIMATE)
		{
		AppPlaySound(SOUND_USER2);
		AckDeleteObject(ae,oNum+20);
		ae->ObjList[oNum].Flags &= ~OF_ANIMATE;
		ae->ObjList[oNum].Flags |= OF_PASSABLE;
		ae->ObjList[oNum].CurNum = 0;
		ae->ObjList[oNum].MaxNum = 0;
		ae->ObjList[oNum].bmNum[0] = 51;
		ae->ObjList[oNum].Speed = 1;
		}
	    else
		Shooting = 1;
	    }
	}
    }
else
    {
    ae->ObjList[oNum].CurNum++;
    if (ae->ObjList[oNum].CurNum >= ae->ObjList[oNum].MaxNum)
	ae->ObjList[oNum].CurNum = 0;
    }

if (wCode)
    {
    wCode &= 0x3F;
    if (wCode == 36)
	{
	smWriteString(180,VP_TIMEY,"   You are so cruel!        ");
	}

    if (hFlag && HoloIndex < 2)
	{
	HoloIndex = 2;
	smWriteString(180,VP_TIMEY,"Holodeck program terminated.");
	ae->bMaps[HoloWalls[0]] = hMaps[HoloIndex];
	ae->ObjList[3].Active = 0;
	ae->ObjList[4].Active = 0;
	ae->ObjList[9].Active = 0;
	ae->ObjList[11].Active = 0;
	}
    }

}

/****************************************************************************
** This is one example of moving a very specific object around in the map. **
** In this case the bolt of energy in the plasma lab is shot out of one	   **
** wall, moves across the room until striking the other wall and then	   **
** starts over.								   **
****************************************************************************/
void UpdateWallBolt(void)
{
    int	    oNum,j,wCode;

oNum = MAX_OBJECTS-2;

if (!ae->ObjList[oNum].Active)
    return;

j = AckMoveObjectPOV(ae,oNum,ae->ObjList[oNum].Dir,ae->ObjList[oNum].Speed);

if (j != POV_NOTHING)
    {
    if (j == POV_PLAYER)
	{
	AppPlaySound(SOUND_HITBADOBJECT);
	mouse_hide_cursor();
	ShowColor(4);
	if (BoltEnergy)
	    {
	    BoltEnergy--;
	    ShowLightbar();
	    }
	mouse_show_cursor();
	}
    ae->ObjList[oNum].x = 1184;
    ae->ObjList[oNum].y = 2976;
    }
else
    {
    ae->ObjList[oNum].CurNum++;
    if (ae->ObjList[oNum].CurNum >= ae->ObjList[oNum].MaxNum)
	ae->ObjList[oNum].CurNum = 0;
    }

}

/****************************************************************************
** This routine updates all the spacemen in the station, first by changing **
** the bitmap that is displayed and second, by updating any plasma bolts   **
** they may have fired. Note that all the work is done here and the ACK	   **
** engine is only called to actually move the objects. The result of the   **
** movement is then checked to see if the player was hit or not.	   **
**									   **
****************************************************************************/
void UpdateSpaceMen(void)
{
    int	    i,j,x,y,px,py,oNum,angle,oHit;
    int	    dx,dy,x1,y1;

x1 = px = ae->xPlayer;
y1 = py = ae->yPlayer;

for (i = 50; i < 70; i++)
    {
    if (!ae->ObjList[i].Active || !(ae->ObjList[i].Flags & OF_ANIMATE))
	{
	if (ae->ObjList[i].bmNum[0] > 48)
	    {
	    if (ae->ObjList[i].Speed-- <= 0)
		{
		ae->ObjList[i].bmNum[0]--;
		ae->ObjList[i].Speed = 1;
		}
	    }
	continue;
	}

    oNum = i + 20;

    if (!ae->ObjList[oNum].Active)
	{
	if (SpaceMenDelay[i-50] > tmCounter)
	    continue;

	x = ae->ObjList[i].x;
	y = ae->ObjList[i].y;

	px = x1;
	py = y1;

	dx = abs(px - x);
	dy = abs(py - y);

	if (dx > dy)
	    py = y;

	if (dx < dy)
	    px = x;

	if (py == y)
	    {
	    if (px < x) angle = INT_ANGLE_180;
	    if (px > x) angle = 0;
	    }

	if (px == x)
	    {
	    if (py < y) angle = INT_ANGLE_270;
	    if (py > y) angle = INT_ANGLE_90;
	    }

	ae->ObjList[oNum].Active = 1;
	ae->ObjList[oNum].x = x;
	ae->ObjList[oNum].y = y;
	ae->ObjList[oNum].Dir = angle;
	}

    j = AckMoveObjectPOV(ae,oNum,ae->ObjList[oNum].Dir,ae->ObjList[oNum].Speed);

    if (j != POV_NOTHING)
	{
	oHit = AckGetObjectHit();
	if (oHit == i)
	    j = POV_NOTHING;
	}

    if (j != POV_NOTHING)
	{
	if (j == POV_PLAYER)
	    {
	    AppPlaySound(SOUND_HITBADOBJECT);
	    mouse_hide_cursor();
	    ShowColor(4);
	    if (BoltEnergy)
		{
		BoltEnergy -= 3;
		if (BoltEnergy < 0)
		    BoltEnergy = 0;

		ShowLightbar();
		}
	    mouse_show_cursor();
	    }

	ae->ObjList[oNum].Active = 0;
	SpaceMenDelay[i-50] = tmCounter + random(30);
	}
    else
	{
	ae->ObjList[oNum].CurNum++;
	if (ae->ObjList[oNum].CurNum >= ae->ObjList[oNum].MaxNum)
	    ae->ObjList[oNum].CurNum = 0;
	}

    }


}


/****************************************************************************
** Display the instruction text and wait for the ENTER key to be pressed.  **
****************************************************************************/
void ShowInstructions(void)
{
    int	    mx,my,mbuttons;

FontColor = 0;
TextBGcolor = 7;

mouse_hide_cursor();
ShowTextFile("instr.txt");
mouse_show_cursor();
mouse_released();

FontColor = 15;

while (!Keys[ENTER_KEY])
    {
    mouse_read_cursor(&mbuttons,&my,&mx);
    if (mbuttons)
	break;
    }

}

extern UCHAR far colordat[];

/****************************************************************************
** Displays the rotating compass under the viewport depending on what	   **
** direction the player is facing.					   **
****************************************************************************/
void ShowCompass(void)
{
    int	    x,wt;
    UCHAR   far *Src,*sBuf;

sBuf = ae->ScreenBuffer + 45896;

wt = (*(int *)CompassBmp);
x = ae->PlayerAngle / 8;

x -= 17;
if (x < 0)
    x += 240;

Src = CompassBmp + x + 4;

for (x = 0; x < 7; x++)
    {
    memmove(sBuf,Src,49);
    sBuf += 320;
    Src += wt;
    }

}

/****************************************************************************
** Quicky routine to display the specified bitmap on the video. Used to	   **
** show the objects being carried so they can be dropped.		   **
**									   **
****************************************************************************/
void ShowBitmap(int x,int y,UCHAR far *Bmp)
{
    int	    row,col;
    UCHAR   far *Video;
    UCHAR   far *vPtr;

Video = MK_FP(0xA000,(y * 320) + x);

for (col = 0; col < 64; col++)
    {
    vPtr = Video;
    for (row = 0; row < 64; row++)
	{
	*vPtr = *Bmp++;
	vPtr += 320;
	}
    Video++;
    }


}

/****************************************************************************
** Clears the screen and shows the objects currently carried by the player.**
** Note that the ACK engine must be called to get a pointer to the bitmap  **
** since it could be in XMS memory.					   **
****************************************************************************/
void ShowInventoryObjects(void)
{
    int	    i,x,y;
    UCHAR   far *Video;
    UCHAR   far *Bmp;

Video = MK_FP(0xA000,0);
mouse_hide_cursor();
memmove(ae->ScreenBuffer,Video,64000);
memset(Video,0,64000);
x = y = 0;

for (i = 0; i < TotalInventory; i++)
    {
    Bmp = AckGetBitmapPtr(ae->ObjList[Inventory[i]].bmNum[0],ae->oMaps);
    ShowBitmap(x,y,Bmp);

    x += 64;
    if (x > 256)
	{
	y += 64;
	x = 0;
	}
    }

Video = MK_FP(0xA000,57600U);
memset(Video,7,6400);
smWriteString(30,190,"Select object");
mouse_show_cursor();

}

/****************************************************************************
** Shows the objects the player is carrying and then allows the player to  **
** select an object to drop. When dropped the object has the current player**
** location. A check is then made to see if all the required objects have  **
** been dropped in the proper location to win the game.			   **
****************************************************************************/
void DropObject(void)
{
    int	    done,oNum,iPos,mx,my,mbutton;
    int	    px,py;
    UCHAR   far *Video;

if (!TotalInventory)
    return;

ShowInventoryObjects();

if (MouseMode)
    mouse_show_cursor();

px = ae->xPlayer >> 6;
py = ae->yPlayer >> 6;

done = 0;
while (!done)
    {
    mouse_read_cursor(&mbutton,&my,&mx);

    if (mbutton & 2 || Keys[ENTER_KEY])
	break;

    if (mbutton & 1)
	{
	my >>= 6;
	mx >>= 6;
	iPos = (my * 4) + mx;
	if (iPos < TotalInventory)
	    {
	    oNum = Inventory[iPos];
	    ae->ObjList[oNum].Active = 1;
	    ae->ObjList[oNum].x = ae->xPlayer;
	    ae->ObjList[oNum].y = ae->yPlayer;

	    mx = MAX_INVENTORY - iPos;
	    memmove(&Inventory[iPos],&Inventory[iPos+1],mx);
	    TotalInventory--;

	    switch (oNum)
		{
		case 25:
		    ObjectList[OBJ_COMPUTER] = 0;
		    if (px > 40 && px < 46 && py > 48 && py < 53)
			ObjectList[OBJ_COMPUTER] = 2;

		    break;

		case 26:
		    ObjectList[OBJ_CIRCUITBOARD] = 0;
		    if (px > 40 && px < 46 && py > 48 && py < 53)
			ObjectList[OBJ_CIRCUITBOARD] = 2;
		    break;

		case 27:
		    ObjectList[OBJ_FUELCELLS] = 0;
		    if (px > 40 && px < 46 && py > 48 && py < 53)
			ObjectList[OBJ_FUELCELLS] = 2;
		    break;

		default:
		    break;
		}
	    break;
	    }

	}


    }

mouse_released();
Video = MK_FP(0xA000,0);
mouse_hide_cursor();
memmove(Video,ae->ScreenBuffer,64000);

if (!MouseMode)
    mouse_show_cursor();

for (mx = 0; mx < 3; mx++)
    {
    if (ObjectList[mx] != 2)
	return;
    }

YouWON = 1;

}

/****************************************************************************
** This routine copies a DP2 brush file on top of the screen for later	   **
** display. Used in the title sequence to move the words over the station. **
**									   **
****************************************************************************/
void OverlayBrush(int x,int y,UCHAR far *Screen,UCHAR far *Brush)
{
    int	    wt,ht,col;
    UINT    offset;
    UCHAR   ch;

wt = (*(int *)Brush);
Brush += 2;
ht = (*(int *)Brush);
Brush += 2;

if (y >= 0)
    offset = (y * 320) + x;
else
    offset = x;

Screen += offset;

for (;ht > 0; ht--)
    {
    if (y >= 0 && y < 199)
	{
	for (col = 0; col < wt; col++)
	    {
	    ch = *Brush++;
	    if (ch)
		Screen[col] = ch;
	    }
	Screen += 320;
	}
    else
	Brush += wt;

    if (++y > 199)
	break;
    }


}

/****************************************************************************
** Displays the space station title.					   **
**									   **
****************************************************************************/
void ShowTitle(void)
{
    int	    sx,sy,ex,ey,ax,ay,len;
    int	    kFlag;
    UINT    offset;
    UCHAR   far *Video;
    UCHAR   far *Screen;
    UCHAR   far *tBuf;
    UCHAR   far *sBuf;
    UCHAR   far *eBuf;
    UCHAR   far *aBuf;

kFlag = 0;
Video = MK_FP(0xA000,0);

Screen = malloc(64000);
if (Screen == NULL)
    return;

tBuf = AckReadiff("bitmaps\\stat01.lbm");
if (tBuf != NULL)
    {
    memmove(tBuf,&tBuf[4],64000);
    memmove(Video,tBuf,64000);
    AckFadeIn(0,255,colordat);
    }

sBuf = AckReadiff("bitmaps\\station.bbm");
eBuf = AckReadiff("bitmaps\\escape.bbm");
aBuf = AckReadiff("bitmaps\\ack3d.bbm");

offset = 76 * 320;
len = 64000 - offset;

if (sBuf != NULL &&
    eBuf != NULL &&
    aBuf != NULL)
    {
    sx = 3;
    sy = -80;
    ex = 17;
    ey = 210;
    ax = 60;
    ay = 210;

    while (sy < 10)
	{
	memmove(Screen,tBuf,64000);
	OverlayBrush(sx,sy,Screen,sBuf);
	memmove(Video,Screen,len);
	sy++;
	if (kbhit())
	    {
	    kFlag = 1;
	    getch();
	    sy = 10;
	    ey = 76;
	    ay = 130;
	    }

	}

    OverlayBrush(sx,sy,tBuf,sBuf);

    while (ey > 76)
	{
	memmove(Screen,tBuf,64000);
	OverlayBrush(ex,ey,Screen,eBuf);
	memmove(&Video[offset],&Screen[offset],len);
	ey--;
	if (kbhit())
	    {
	    kFlag = 1;
	    getch();
	    ey = 76;
	    ay = 130;
	    }
	}

    OverlayBrush(ex,ey,tBuf,eBuf);

    while (ay > 130)
	{
	memmove(Screen,tBuf,64000);
	OverlayBrush(ax,ay,Screen,aBuf);
	memmove(&Video[offset],&Screen[offset],len);
	ay--;
	if (kbhit())
	    {
	    kFlag = 1;
	    getch();
	    ay = 130;
	    }
	}

    }


if (Screen != NULL)
    free(Screen);

if (tBuf != NULL)
    free(tBuf);

if (sBuf != NULL)
    free(sBuf);

if (eBuf != NULL)
    free(eBuf);

if (aBuf != NULL)
    free(aBuf);

if (!kFlag)
    {
    tBuf = AckReadiff("bitmaps\\credits.lbm");
    if (tBuf != NULL)
	{
	AckFadeOut(0,255);
	memmove(Video,&tBuf[4],64000);
	memset(tBuf,0,768);
	AckSetPalette(tBuf);
	AckFadeIn(0,255,colordat);
	ex = 500;

	while (ex--)
	    {
	    if (kbhit())
		{
		getch();
		break;
		}
	    delay(10);

	    }
	free(tBuf);
	}
    }

}

/****************************************************************************
** Checks the map location of the player for special things, in this case  **
** to see if the player is about ready to enter the holodeck.		   **
**									   **
****************************************************************************/
void CheckPlayerSquare(void)
{
    int	    row,col,mPos,hProg,aFlag;

row = ae->yPlayer >> 6;
col = ae->xPlayer >> 6;
mPos = (row << 6) + col;
aFlag = 0;

if (!HoloSoundFlag &&
    col == 11 &&
    ae->PlayerAngle > INT_ANGLE_180 &&
    row == 33)
    {
    hProg = PickHoloProgram();

    switch (hProg)
	{
	case -1:
	    return;

	case 0:
	    HoloIndex = 2;
	    break;

	case 1:
	    aFlag = 1;
	    HoloIndex = 0;
	    break;

	case 2:
	    HoloIndex = 1;
	    break;

	default:
	    break;
	}

    ae->ObjList[3].Active = aFlag;
    ae->ObjList[4].Active = aFlag;
    ae->ObjList[9].Active = aFlag;
    ae->ObjList[11].Active = aFlag;
    ae->bMaps[HoloWalls[0]] = hMaps[HoloIndex];
    HoloSoundFlag = 1;
    AppPlaySound(SOUND_USER1);
    return;
    }

if (col != 11 || row != 33)
    HoloSoundFlag = 0;

}

/****************************************************************************
** Our main entry point. There is alot of stuff here that should be	   **
** broken out into separate routines. My apologies for the mess!	   **
**									   **
****************************************************************************/
int main(int argc,char *argv[])
{
    int	    i,j,result,done;
    int	    ViewNum,count;
    int	    Spin,SpinAngle;
    int	    mx,my,mbuttons;
    int	    LostFlag,SkipTitle;
    int	    NoMusic,MusicFlag;
    char    LastSeconds;
    UCHAR   far *oBuf;
    UCHAR   far *Video;
    UCHAR   OldColor,NewColor;


if (!InitializeMouse())
    {
    printf("Mouse required to run.\n");
    return(1);
    }


/* Disabled for now, should be in final version to not run if memory low */
#if 0
mx = (int)(farcoreleft() / 1024L);
if (mx < 450)
    {
    printf("Not enough memory to run. Current memory: %d\n",mx);
    return(1);
    }
#endif

/*------------------------------------------------------------------------*/
/* Get the memory for the interface structure. This can either be GLOBAL  */
/* or allocated.							  */
/*------------------------------------------------------------------------*/
ae = malloc(sizeof(ACKENG));
if (ae == NULL)
    {
    printf("Not enough memory to run.\n");
    return(1);
    }

memset(ae,0,sizeof(ACKENG));

if (LoadSmallFont())
    {
    printf("Not enough memory to run.\n");
    return(1);
    }

YouWON = 0;
BoltEnergy = 77;
Shooting = 0;
LostFlag = 0;
ViewNum = 0;
SoundDevice = DEV_SOUNDBLASTER;
MouseMode = 0;
SkipTitle = 0;
NoMusic = 0;
HoloSoundFlag = 0;
TextBGcolor = 7;
randomize();
MusicFlag = 1;

if (argc > 1)
    {
    for (i = 1; i < argc; i++)
	{
	if (!stricmp(argv[i],"-NS"))
	    SoundDevice = DEV_NOSOUND;

	if (!stricmp(argv[i],"-M1"))
	    MouseMode = 1;

	if (!stricmp(argv[i],"-SP"))
	    SoundDevice = DEV_PCSPEAKER;

	if (!stricmp(argv[i],"-ST"))
	    SkipTitle = 1;

	if (!stricmp(argv[i],"-NM"))
	    NoMusic = 1;
	}
    }


AckSetVGAmode();
memset(colordat,0,768);
AckSetPalette(colordat);

if (!SkipTitle)
    ShowTitle();


#if USE_SOUND
if (AckSoundInitialize(SoundDevice))
    {
    AckSetTextmode();
    printf("Error initializing sound.\n");
    return(1);
    }
#endif


WallDelay = WALL_DELAY;

tmHours = START_HOURS;
tmMinutes = START_MINUTES;
LastSeconds = tmSeconds = START_SECONDS;
tmDelay = TIME_DELAY;


/*------------------------------------------------------------------------*/
/* Setup the structure for this particular application. The most important*/
/* fields before initializing are the viewport (or Win...) fields.	  */
/*------------------------------------------------------------------------*/
ae->WinStartY = VP_STARTY;
ae->WinEndY = VP_ENDY;
ae->WinStartX = VP_STARTX;
ae->WinEndX = VP_ENDX;
ae->LightFlag = SHADING_ON;
ae->xPlayer = Views[ViewNum].xP;
ae->yPlayer = Views[ViewNum].yP;
ae->PlayerAngle = Views[ViewNum].Angle;
ae->TopColor = 28;
ae->BottomColor = 28;
ae->DoorSpeed = 4;
ae->NonSecretCode = 1;
strcpy(GridFile,"demomap.l01");

result = AckInitialize(ae);
if (result)
    {
    AckSetTextmode();
    printf("Initialize Error: %d\n",result);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }

if (ReadMasterFile("demo.l01"))
    {
    AckSetTextmode();
    printf("Error reading ASCII file - ErrorCode = %d\n",ErrorCode);
    AckWrapUp(ae);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }

result = AckReadMapFile(ae,GridFile);
if (result)
    {
    AckSetTextmode();
    printf("Error reading map file - ErrorCode = %d\n",result);
    AckWrapUp(ae);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }

i = ae->MaxObjects;

nums[0] = 24;
nums[1] = 25;
nums[2] = 26;
nums[3] = 27;
ae->ObjList[MAX_OBJECTS-1].Dir = 10;
ae->ObjList[MAX_OBJECTS-1].Speed = 44;
AckCreateObject(ae,MAX_OBJECTS-1,4,nums);

ae->ObjList[MAX_OBJECTS-2].Dir = 10;
ae->ObjList[MAX_OBJECTS-2].Speed = 34;
AckCreateObject(ae,MAX_OBJECTS-2,4,nums);
ae->ObjList[MAX_OBJECTS-2].Dir = INT_ANGLE_270;
ae->ObjList[MAX_OBJECTS-2].x = 1184;
ae->ObjList[MAX_OBJECTS-2].y = 2976;
ae->ObjList[MAX_OBJECTS-2].Active = 1;

ae->MaxObjects = i;

ae->ObjList[35].Active = 0;
ae->ObjList[36].Active = 0;
ae->ObjList[37].Active = 0;

if (ae->BkgdBuffer)
    free(ae->BkgdBuffer);

ae->BkgdBuffer = AckReadiff("bitmaps\\back1.lbm");

if (ae->BkgdBuffer == NULL)
    {
    AckSetTextmode();
    printf("Not enough memory to load background.\n");
    AckWrapUp(ae);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }

CompassBmp = AckReadiff("bitmaps\\compass.bbm");
if (CompassBmp == NULL)
    {
    AckSetTextmode();
    printf("Not enough memory to run.\n");
    AckWrapUp(ae);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }

/*------------------------------------------------------------------------*/
/* Load our main screen which can also be used as an overlay		  */
/*------------------------------------------------------------------------*/
oBuf = AckReadiff("bitmaps\\demo5.lbm");

if (oBuf == NULL)
    {
    AckSetTextmode();
    printf("Not enough memory to load overlay.\n");
    AckWrapUp(ae);

#if USE_SOUND
    AckSoundShutdown();
#endif

    return(1);
    }


#if USE_SOUND
    for (i = 0; i < SOUND_MAX_INDEX; i++)
	{
	if (SoundFiles[i] != NULL)
	    AckLoadSound(i,SoundFiles[i]);

	}

    if (!NoMusic)
	AckPlayBackground(MusicFile);
    else
	MusicFlag = 0;

#endif

SetupAnimatedWalls();

Video = MK_FP(0xA000,0);

if (!SkipTitle)
    {
    AckFadeOut(0,255);
    memset(Video,0,64000);
    memset(ae->ScreenBuffer,0,768);
    AckSetPalette(ae->ScreenBuffer);
    }

AckLoadAndSetPalette(PalFile);

memset(ae->ScreenBuffer,0,768);
AckSetPalette(ae->ScreenBuffer);
/*------------------------------------------------------------------------*/
/* Just blit the main screen to the video (then fade later)		  */
/*------------------------------------------------------------------------*/
memmove(Video,&oBuf[4],64000);

AckCreateOverlay(ae,&oBuf[4]);

ClearStatusLine(7);
ShowTime();
ShowLightbar();
if (!SkipTitle)
    ShowTextFile("intro.txt");

AckFadeIn(0,255,colordat);

if (!SkipTitle)
    {
    mbuttons = 0;
    while (!mbuttons)
	{
	mouse_read_cursor(&mbuttons,&my,&mx);
	if (kbhit())
	    {
	    getch();
	    break;
	    }
	}
    }

oldvec=getvect(KEYBD);
setvect(KEYBD,myInt);

OldTimer = getvect(0x1C);
setvect(0x1C,MyTimer);

/*------------------------------------------------------------------------*/
/* Use our main screen to create an overlay (we don't use it but this     */
/* is how an application would call the ACK engine)			  */
/*------------------------------------------------------------------------*/

if (!MouseMode)
    mouse_show_cursor();

LastMouseIndex = MOUSE_ARROW;
SetMouseCursor(LastMouseIndex);
Spin = 0;
SpinAngle = 0;
done = 0;

/*------------------------------------------------------------------------*/
/* This is our main loop for processing until the player exits or the	  */
/* game is completed (win or lose).					  */
/*------------------------------------------------------------------------*/
while (!done)
    {
    if (LastSeconds != tmSeconds)
	{
	ShowTime();
	LastSeconds = tmSeconds;

	if (tmHours == 0 && tmMinutes == 0 && tmSeconds == 0)
	    {
	    LostFlag = 1;
	    break;
	    }
	}

/*------------------------------------------------------------------------*/
/* Call the routine to change any wall tiles that need changing.	  */
/*------------------------------------------------------------------------*/
    AnimateWalls();

/*------------------------------------------------------------------------*/
/* Update the location of the energy bolt if it was fired.		  */
/*------------------------------------------------------------------------*/
    if (Shooting)
	UpdateBomb();

    UpdateWallBolt();
    UpdateSpaceMen();

/*------------------------------------------------------------------------*/
/* Call the engine to animate objects and then build the scene		  */
/*------------------------------------------------------------------------*/
    AckCheckObjectMovement(ae);
    AckBuildView(ae);
    AckDrawOverlay(ae->ScreenBuffer,ae->OverlayBuffer);
    ShowCompass();

    i = 0;
    mouse_read_cursor(&mbuttons,&my,&mx);
    if (mx >= VP_STARTX-14 && mx <= VP_ENDX && my >= 0 && my <= VP_ENDY)
	{
	mouse_hide_cursor();
	i = 1;
	}

    if (InventoryFlag)
	ShowInventory();

    if (LockedFlag)
	{
	smWriteHUD(155,100,15,"LOCKED");
	LockedFlag = 0;
	}

    AckDisplayScreen(ae);

    if (!MouseMode)
	CheckMouseCursor(mx,my);

    if (i)
	mouse_show_cursor();

/*------------------------------------------------------------------------*/
/* Check open/close status of doors and play appropriate sounds		  */
/*------------------------------------------------------------------------*/
    PlayDoorSounds();

    if (!BoltEnergy)
	{
	LostFlag = 1;
	break;
	}

    if (YouWON)
	break;

/*------------------------------------------------------------------------*/
/* Check to see if decompression has occurred in the station!		  */
/*------------------------------------------------------------------------*/
    if (Decompress)
	{
	AppPlaySound(SOUND_HITWALL);	/* Change to decompress sound! */
	ShowColor(4);
	delay(500);
	ShowColor(64+4);
	delay(500);
	ShowColor(128+4);
	delay(500);
	ShowColor(192+4);
	delay(1000);
	LostFlag = 1;
	break;
	}

    if (Spin)
	{
	Spin >>= 1;
	ae->PlayerAngle += SpinAngle;
	if (ae->PlayerAngle >= INT_ANGLE_360)
	    ae->PlayerAngle -= INT_ANGLE_360;
	if (ae->PlayerAngle < 0)
	    ae->PlayerAngle += INT_ANGLE_360;

	}

/*------------------------------------------------------------------------*/
/* We'll allow two different modes of operation of the mouse. In mode 0   */
/* below a mouse cursor will be displayed and change shape depending on	  */
/* what area of the viewport it is on. Mode 1 below will use the movement */
/* of the mouse to move the POV ala Wolf-3D. Only mode 0 will allow the	  */
/* player to select icons for various actions.				  */
/*------------------------------------------------------------------------*/
    if (!MouseMode)
	{
	mouse_read_cursor(&mbuttons,&my,&mx);
	if (mbuttons & 1)
	    {

	    switch (LastMouseIndex)
		{
		case MOUSE_ARROW:
		    break;

		case MOUSE_UPARROW:
		    j = AckMovePOV(ae,ae->PlayerAngle,16);

		    if (j == POV_XWALL || j == POV_YWALL)
			AppPlaySound(SOUND_HITWALL);

		    if (j == POV_OBJECT)
			CheckOurObjects();

		    j = AckCheckDoorOpen(ae->xPlayer,
					 ae->yPlayer,
					 ae->PlayerAngle,ae);

		    /* Do something if door is locked */
		    if (j & POV_DOORLOCKED)
			LockedFlag = 1;

		    CheckPlayerSquare();
		    break;

		case MOUSE_DNARROW:
		    j = ae->PlayerAngle + INT_ANGLE_180;
		    if (j >= INT_ANGLE_360)
			j -= INT_ANGLE_360;

		    i = AckMovePOV(ae,j,16);

		    if (i == POV_XWALL || i == POV_YWALL)
			AppPlaySound(SOUND_HITWALL);

		    break;

		case MOUSE_LTARROW:
		    SpinAngle = -INT_ANGLE_4;
		    Spin = 1;
		    break;

		case MOUSE_RTARROW:
		    SpinAngle = INT_ANGLE_4;
		    Spin = 1;
		    break;

		default:
		    break;

		}



    /*------------------------------------------------------------------------*/
    /* Now check to see if the mouse has hit one of the icons		      */
    /*------------------------------------------------------------------------*/
	    if (mx >= 10 && mx <= 131 && my >= 131 && my <= 139) /* Inventory */
		{
		mouse_released();
		InventoryFlag ^= 1;
		}

	    if (mx >= 28 && mx <= 45 && my >= 142 && my <= 150) /* Map icon */
		{
		mouse_released();
		ShowOverhead();
		}

	    if (mx >= 292 && mx <= 312 && my >= 131 && my <= 139) /* Help */
		{
		mouse_released();
		ShowInstructions();
		}

	    if (mx >= 273 && mx <= 295 && my >= 142 && my <= 150) /* Drop */
		{
		mouse_released();
		DropObject();
		}
	    }
	}
    else
	{
	CheckMouse(&mouse);

	if (mouse.mdx < 0)
	    {
	    Spin = -mouse.mdx;
	    Spin >>= 3;
	    SpinAngle = -INT_ANGLE_2 * Spin;
	    Spin = 1;
	    }

	if (mouse.mdx > 0)
	    {
	    Spin = mouse.mdx;
	    Spin >>= 3;
	    SpinAngle = INT_ANGLE_2 * Spin;
	    Spin = 1;
	    }

	if (mouse.mdy < 0)
	    {
	    i = -mouse.mdy;
	    i >>= 2;
	    i += 16;
	    j = AckMovePOV(ae,ae->PlayerAngle,i);

	    if (j == POV_XWALL || j == POV_YWALL)
		AppPlaySound(SOUND_HITWALL);

	    if (j == POV_OBJECT)
		CheckOurObjects();

	    j = AckCheckDoorOpen(ae->xPlayer,ae->yPlayer,ae->PlayerAngle,ae);
	    if (j & POV_DOORLOCKED)
		LockedFlag = 1;

	    CheckPlayerSquare();
	    }

	if (mouse.mdy > 0)
	    {
	    i = mouse.mdy;
	    i >>= 2;
	    i += 16;
	    j = ae->PlayerAngle + INT_ANGLE_180;
	    if (j >= INT_ANGLE_360)
		j -= INT_ANGLE_360;

	    i = AckMovePOV(ae,j,i);

	    if (i == POV_XWALL || i == POV_YWALL)
		AppPlaySound(SOUND_HITWALL);
	    }
	}

/*------------------------------------------------------------------------*/
/* The right button or spacebar activates doors				  */
/*------------------------------------------------------------------------*/
    if ((mbuttons & 2) || (Keys[SPACEBAR_KEY]))
	{
	if (BoltEnergy)
	    {
	    i = MAX_OBJECTS-1;
	    if (!ae->ObjList[i].Active)
		{
		AppPlaySound(SOUND_FIRING);
		ae->ObjList[i].x = ae->xPlayer;
		ae->ObjList[i].y = ae->yPlayer;
		ae->ObjList[i].Dir = ae->PlayerAngle;
		ae->ObjList[i].mPos = (ae->yPlayer & 0xFFC0) + (ae->xPlayer >> 6);
		ae->ObjList[i].VidRow = 160;
		ae->ObjList[i].Active = 1;
		Shooting = 1;
		BoltEnergy--;
		mouse_hide_cursor();
		ShowLightbar();
		mouse_show_cursor();
		}
	    }
	}

/*------------------------------------------------------------------------*/
/* The keyboard is now checked.						  */
/*------------------------------------------------------------------------*/
    if(Keys[ESCAPE_KEY])
	break;

    if(Keys[RIGHT_ARROW_KEY])
	{
	Spin += 2;
	SpinAngle = INT_ANGLE_2 * Spin;
	}

    if(Keys[LEFT_ARROW_KEY])
	{
	Spin += 2;
	SpinAngle = -INT_ANGLE_2 * Spin;
	}

    if(Keys[UP_ARROW_KEY])
	{
	j = AckMovePOV(ae,ae->PlayerAngle,16);

	if (j == POV_XWALL || j == POV_YWALL)
	    AppPlaySound(SOUND_HITWALL);

	if (j == POV_OBJECT)
	    CheckOurObjects();

	j = AckCheckDoorOpen(ae->xPlayer,ae->yPlayer,ae->PlayerAngle,ae);
	if (j & POV_DOORLOCKED)
	    LockedFlag = 1;

	CheckPlayerSquare();
	}

    if(Keys[DOWN_ARROW_KEY])
	{
	j = ae->PlayerAngle + INT_ANGLE_180;
	if (j >= INT_ANGLE_360)
	    j -= INT_ANGLE_360;

	j = AckMovePOV(ae,j,16);

	if (j == POV_XWALL || j == POV_YWALL)
	    AppPlaySound(SOUND_HITWALL);

	if (j == POV_OBJECT)
	    CheckOurObjects();

	CheckPlayerSquare();
	}

    if (Keys[F1_KEY])
	{
	MouseMode ^= 1;
	while (Keys[F1_KEY]);
	if (!MouseMode)
	    mouse_show_cursor();
	else
	    mouse_hide_cursor();
	}

    if (Keys[LETTER_I_KEY])
	{
	InventoryFlag ^= 1;
	while (Keys[LETTER_I_KEY]);
	}

    if (Keys[LETTER_L_KEY])
	{
	ae->LightFlag ^= 1;
	}

    if (Keys[LETTER_M_KEY])
	{
	while (Keys[LETTER_M_KEY]);
	ShowOverhead();
	}

    if (Keys[LETTER_H_KEY])
	{
	while (Keys[LETTER_H_KEY]);
	ShowInstructions();
	}

    if (Keys[LETTER_D_KEY])
	{
	while (Keys[LETTER_D_KEY]);
	DropObject();
	}

    if (Keys[LETTER_S_KEY])
	{
	while (Keys[LETTER_S_KEY]);

	if (!NoMusic)
	    {
	    if (MusicFlag)
		{
		AckStopBackground();
		MusicFlag = 0;
		}

	    }
	}


/*------------------------------------------------------------------------*/
/* This is some test code put in to try different players in the same	  */
/* map. The number keys 1,2,3 activate 3 different players that all start */
/* out in the same place but at different angles. By moving a player and  */
/* then pressing 1,2,3 the new player can walk around and see the other	  */
/* players as space-suited characters. Not all in yet, but its a start.	  */
/*------------------------------------------------------------------------*/
    if (Keys[NUMBER_1_KEY] ||
	Keys[NUMBER_2_KEY] ||
	Keys[NUMBER_3_KEY])
	{
	Views[ViewNum].xP = ae->xPlayer;
	Views[ViewNum].yP = ae->yPlayer;
	Views[ViewNum].Angle = ae->PlayerAngle;
	ae->ObjList[ViewNum+5].x = ae->xPlayer;
	ae->ObjList[ViewNum+5].y = ae->yPlayer;
	ae->ObjList[ViewNum+5].Active = 1;
	j = (ae->ObjList[ViewNum+5].y & 0xFFC0) + (ae->ObjList[ViewNum+5].x >> 6);

	if (Keys[NUMBER_1_KEY])
	    ViewNum = 0;
	if (Keys[NUMBER_2_KEY])
	    ViewNum = 1;
	if (Keys[NUMBER_3_KEY])
	    ViewNum = 2;
	ae->xPlayer = Views[ViewNum].xP;
	ae->yPlayer = Views[ViewNum].yP;
	ae->PlayerAngle = Views[ViewNum].Angle;
	ae->ObjList[ViewNum+5].x = ae->xPlayer;
	ae->ObjList[ViewNum+5].y = ae->yPlayer;
	ae->ObjList[ViewNum+5].Active = 0;
	j = (ae->ObjList[ViewNum+5].y & 0xFFC0) + (ae->ObjList[ViewNum+5].x >> 6);
	}

    }


setvect(KEYBD,oldvec);
setvect(0x1C,OldTimer);

/*------------------------------------------------------------------------*/
/* Here if time ran out, meaning the game has been lost.		  */
/*------------------------------------------------------------------------*/
if (LostFlag)
    {
    YouWON = 0;
    if (!Decompress)
	{
	if (BoltEnergy)
	    ShowTextFile("lost.txt");
	else
	    ShowTextFile("lost1.txt");

	}
    else
	ShowTextFile("decomp.txt");
    AppPlaySound(SOUND_LOST);
    i = 3000;
    while (i)
	{
	if (kbhit())
	    {
	    getch();
	    break;
	    }
	delay(10);
	i--;
	}
    AckFadeOut(0,255);
    }

if (YouWON)
    {
    ShowTextFile("won.txt");
    AppPlaySound(SOUND_USER3);
    i = 3000;
    while (i)
	{
	if (kbhit())
	    {
	    getch();
	    break;
	    }
	delay(10);
	i--;
	}
    AckFadeOut(0,255);
    }

AckWrapUp(ae);

#if USE_SOUND
AckSoundShutdown();
#endif

AckSetTextmode();

return(0);
}

