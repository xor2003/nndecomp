/*********************( Animation Construction Kit Demo )**********************/
/*				Lary Myers				      */
/*									      */
/* This module reads in the ASCII description file which describes all the    */
/* wall and object bitmaps, object definitions, sound files, and color	      */
/* ranges for light shading. It was done this way vs using one big resource   */
/* file so that it could be easily modified to try various bitmaps and such.  */
/* A commercial style game would want to combine all this information into    */
/* common files which could then be compressed, etc to save disk space.	      */
/*									      */
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

/* Variables contained in DEMO.C */
extern	ACKENG	*ae;
extern	char far *SoundFiles[];
extern	char	 MusicFile[];


/****** G L O B A L S ******************************/
	    int			ErrorCode;
	    char		GridFile[128];
	    char		PalFile[128];


/* Used by the light shading routines */
typedef struct
    {
    unsigned char start;
    unsigned char length;
    }ColorRange;


/****************************************************************************
** Return just the extension portion of the filename.			   **
****************************************************************************/
char *GetExtent(char *s)
{
    char    *e;

e = strchr(s,'.');
if (e == NULL)
    return(s);
e++;

return(e);
}

/****************************************************************************
** Remove any linefeeds or carriage returns from the string		   **
****************************************************************************/
char *StripEndOfLine(char *s)
{
    int	    len;
    char    ch;

len = strlen(s);

while (--len >= 0)
    {
    ch = s[len];
    if (ch != ' ' && ch != ';' && ch != '\t' && ch != 13 && ch != 10)
	break;

    s[len] = '\0';
    }

return(s);
}

/****************************************************************************
** Skip an leading spaces in the string					   **
****************************************************************************/
char *SkipSpaces(char *s)
{

while (*s == ' ' || *s == '\t' || *s == ',')
    strcpy(s,&s[1]);

return(s);
}

/****************************************************************************
** Add specified extent if needed onto the end of the filename.		   **
****************************************************************************/
char *AddExtent(char *s,char *ext)
{
if (strchr(s,'.') == NULL)
    strcat(s,ext);

return(s);
}

/****************************************************************************
** Copies source to destination until delimiter is found.		   **
****************************************************************************/
char *CopyToComma(char *dest,char *src)
{
    char    ch;

while (*src)
    {
    ch = *src++;
    if (ch == ' ' || ch == '\t' || ch == ',')
	break;

    *dest++ = ch;
    }

*dest = '\0';

return(src);
}


/****************************************************************************
** Reads and parses the ASCII file containing the demo information.	   **
**									   **
****************************************************************************/
int ReadMasterFile(char *fname)
{
    FILE    *fp;
    int	    bType,bNum,result;
    int	    value,ObjIndex;
    int	    Mode = 0;
    int     fMode = 0,i,j,found,k;
    char    *s;
    char    bName[128];
    char    fBuf[80];
    char    rangenos = 0,plotcolor;   //**MOD
    ColorRange ranges[64];  //**MOD

fp = fopen(fname,"rt");
if (fp == NULL)
    {
    printf("Master file %s not found.\n");
    ErrorCode = ERR_BADFILE;
    return(-1);
    }

bNum = 1;
bType = TYPE_WALL;
result = 0;

while (!result)
    {
    if (feof(fp))
	break;

    *bName = '\0';
    fgets(bName,127,fp);

    if (*bName == ';')
	continue;

    StripEndOfLine(bName);
    SkipSpaces(bName);

    if (!strlen(bName))
	continue;

    if (*bName == ';')
	continue;

    if (!strnicmp(bName,"SOUND:",6))
	{
	value = atoi(&bName[7]);
	if (value < 0 || value > SOUND_MAX_INDEX)
	    {
	    printf("Invalid sound index: %s\n",bName);
	    ErrorCode = ERR_BADCOMMAND;
	    result = -1;
	    }

	strcpy(bName,SkipSpaces(&bName[7]));

	s = strpbrk(bName,", \t");
	if (s == NULL)
	    {
	    printf("Unable to locate name for sound file: %s.\n",bName);
	    ErrorCode = ERR_BADSYNTAX;
	    result = -1;
	    continue;
	    }

	strcpy(fBuf,SkipSpaces(s));
	AddExtent(fBuf,".voc");
	SoundFiles[value] = malloc(strlen(fBuf)+1);
	if (SoundFiles[value] == NULL)
	    {
	    ErrorCode = ERR_NOMEMORY;
	    result = -1;
	    continue;
	    }

	strcpy(SoundFiles[value],fBuf);
	continue;
	}

    if (!strnicmp(bName,"MUSIC:",6))
	{
	strcpy(MusicFile,SkipSpaces(&bName[6]));
	continue;
	}



    if (!stricmp(bName,"WALLS:"))
	{
	bType = TYPE_WALL;
	bNum = 1;
	Mode = 1;
	continue;
	}

    if (!stricmp(bName,"ENDWALLS:"))
	{
	if (Mode != 1)
	    {
	    printf("Invalid place for command: %s.\n",bName);
	    ErrorCode = ERR_BADCOMMAND;
	    result = -1;
	    }

	Mode = 0;
	continue;
	}

    if (!stricmp(bName,"OBJECTS:"))
	{
	bType = TYPE_OBJECT;
	bNum = 40;
	ObjIndex = 1;
	Mode = 2;
	continue;
	}

    if (!stricmp(bName,"FILES:"))
	{
	fMode = 1;
	continue;
	}

    if (!stricmp(bName,"ENDFILES:"))
	{
	fMode = 0;
	continue;
	}

    if (fMode)
	{
	value = atoi(bName);
	if (value < 1 || value > 255)
	    {
	    printf("Invalid number for object: %s.\n",bName);
	    ErrorCode = ERR_BADOBJNUMBER;
	    result = -1;
	    continue;
	    }

	s = strpbrk(bName,", \t");
	if (s == NULL)
	    {
	    printf("Unable to locate bitmap name for object: %s.\n",bName);
	    ErrorCode = ERR_BADSYNTAX;
	    result = -1;
	    continue;
	    }

	strcpy(fBuf,SkipSpaces(s));
	AddExtent(fBuf,".img");

	if (AckLoadBitmap(ae,value,bType,fBuf))
	    {
	    printf("Error loading bitmap \"%s\".\n",fBuf);

	#if 0
	    ErrorCode = ERR_LOADINGBITMAP;
	#endif
	    result = -1;
	    }
	continue;
	}



    if (Mode == 2)
	{
	if (!strnicmp(bName,"NUMBER:",7))
	    {
	    value = atoi(&bName[7]);

	    if (value < 1 || value >= MAX_OBJECTS)
		{
		printf("Invalid object number:\n%s\n",bName);
		ErrorCode = ERR_BADOBJNUMBER;
		result = -1;
		break;
		}
	    ObjIndex = value;
	    continue;
	    }

	if (!strnicmp(bName,"DIRECTION:",10))
	    {
	    value = atoi(&bName[10]);
	    if (value < 0 || value > 10)
		{
		printf("Invalid direction: %d.\n",value);
		ErrorCode = ERR_BADDIRECTION;
		result = -1;
		continue;
		}

	    ae->ObjList[ObjIndex].Dir = value;
	    if (value == 10)
		{
		ae->ObjList[ObjIndex].Sides = 0;
		ae->ObjList[ObjIndex].Flags |= OF_ANIMATE;
		}
	    continue;
	    }

	if (!strnicmp(bName,"SPEED:",6))
	    {
	    ae->ObjList[ObjIndex].Speed = atoi(&bName[6]);
	    continue;
	    }

	if (!strnicmp(bName,"FLAGS:",6))
	    {
	    strupr(bName);
	    if (strstr(bName,"PASSABLE") != NULL)
		{
		ae->ObjList[ObjIndex].Flags |= OF_PASSABLE;
		}
	    continue;
	    }


	if (!strnicmp(bName,"BITMAPS:",8))
	    {
	    strcpy(bName,SkipSpaces(&bName[8]));
	    value = 0;
	    while (value < MAX_VIEWS && *bName)
		{
		strcpy(bName,CopyToComma(fBuf,bName));
		SkipSpaces(fBuf);
		bNum = atoi(fBuf);

		if (bNum < 1 || bNum > 255)
		    {
		    printf("Invalid bitmap number for object: %d\n",ObjIndex);
		    ErrorCode = ERR_BADOBJNUMBER;
		    result = -1;
		    break;
		    }

		ae->ObjList[ObjIndex].bmNum[value] = bNum;
		value++;
		}

	    AckCreateObject(ae,ObjIndex,value,ae->ObjList[ObjIndex].bmNum);
	    continue;
	    }

	if (!strnicmp(bName,"ENDOBJECTS:",11))
	    {
	    Mode = 0;
	    continue;
	    }

	}

    if (!strnicmp(bName,"RANGE:",6))
        {
        int start,colnum;
        strcpy(bName,SkipSpaces(&bName[6]));
		strcpy(bName,CopyToComma(fBuf,bName));
        SkipSpaces(fBuf);
	start =atoi(fBuf);
		strcpy(bName,CopyToComma(fBuf,bName));
        SkipSpaces(fBuf);
	colnum=atoi(fBuf);
	ranges[rangenos].start	= start;
	ranges[rangenos].length = colnum;
	rangenos ++;
	continue;
	}

    if (!strnicmp(bName,"PALFILE:",8))
	{
	strcpy(PalFile,SkipSpaces(&bName[8]));
	continue;
	}

    if (!strnicmp(bName,"MAPFILE:",8))
	{
	strcpy(GridFile,SkipSpaces(&bName[8]));
	continue;
	}

    }

fclose(fp);

/* Setup the light shading ranges for use by the engine */

for ( i = 0;i<16;i++)
    {
    for (j=0;j<256;j++)
	{
	found = 0;
	// find the range the color is in.
	for ( k = 0; k < rangenos; k++ )
	    {
	    if (j >= ranges[k].start && j < ranges[k].start+ranges[k].length)
		{
		found = 1;
		break;
		}
	    }
	if (found)
	    {
	    // add color + i;
	    // if color + i > color+range then plot color = 0;
	    // otherwise plotcolor = color+i
	    if (j+i >= ranges[k].start+ranges[k].length)
		   plotcolor = 0;
	    else
		   plotcolor = j+i;
	    }
	else
	    {
	    plotcolor = j;
	    }
	ae->PalTable[j+(i*256)] = plotcolor;
	}
    }

return(result);
}

