/* Last modified DATE= 05/30/93 at TIME= 00:11:44 */
/*   Title vga18.c */

#include <dos.h>

#define MINT __int__(0x33)

	int vga_mouse_modifier = 2;




/*doc*/
/****************************************************************************
** Returns a -1 if mouse IS installed					   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
int mouse_installed(void)
{
_AX = 0;
MINT;
return(_AX);
}

/*doc*/
/****************************************************************************
** Shows the mouse cursor						   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_show_cursor(void)
{
_AX = 1;
MINT;
}

/*doc*/
/****************************************************************************
** Turns mouse cursor off						   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_hide_cursor(void)
{
_AX = 2;
MINT;
}


/*doc*/
/****************************************************************************
** Returns button status, mouse row and column (passed by &mrow,&mcol)	   **
** 640 x 200 even if in text mode.					   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_read_cursor(int *bstatus,int *mrow,int *mcol)
{
_AX = 3;
MINT;
_AX = _BX;
*bstatus = _AX;
*mcol = _CX;
*mrow = _DX;
*mcol /= vga_mouse_modifier;	    /* Modify according to video mode */

}

/*doc*/
/****************************************************************************
** Sets mouse cursor to desired row, column				   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_cursor(int mrow,int mcol)
{
mcol *= vga_mouse_modifier;
_CX = mcol;
_DX = mrow;
_AX = 4;
MINT;
}

/*doc*/
/****************************************************************************
** Returns button status for desired button (in bstatus)		   **
** column is modified for current vga video mode			   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_press_info(int *bstatus,int *bcount,int *mrow,int *mcol)
{
    int	    temp;

_BX = *bstatus;
_AX = 5;
MINT;
temp = _BX;
*bstatus = _AX;
*bcount = temp;
*mcol = _CX;
*mrow = _DX;
*mcol /= vga_mouse_modifier;	    /* Modify according to video mode */

}


/*doc*/
/****************************************************************************
** Returns button release status for desired button (in bstatus)	   **
** column is modified for current vga video mode			   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_release_info(int *bstatus,int *bcount,int *mrow,int *mcol)
{
    int	    temp;

_BX = *bstatus;
_AX = 6;
MINT;
temp = _BX;
*bstatus = _AX;
*bcount = temp;
*mcol = _CX;
*mrow = _DX;
*mcol /= vga_mouse_modifier;	    /* Modify according to video mode */

}



/*doc*/
/****************************************************************************
** Defines left and right columns for mouse to travel in.		   **
** Uses mouse coordinates 0-639						   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_minmax_columns(int mincol,int maxcol)
{
_CX = mincol;
_DX = maxcol;
_AX = 7;
MINT;
}


/*doc*/
/****************************************************************************
** Defines top and bottom rows for mouse to travel in.			   **
** Uses mouse coordinates 0-349						   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_minmax_rows(int minrow,int maxrow)
{
_CX = minrow;
_DX = maxrow;
_AX = 8;
MINT;
}


/*doc*/
/****************************************************************************
** Set shape of graphics mouse cursor.	8 byte mask, Hot Spot row, col.	   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_graphics_cursor(int hsrow,int hscol,char far *mask)
{
_DX = FP_OFF(mask);
_ES = FP_SEG(mask);
_CX = hsrow;
_BX = hscol;
_AX = 9;
MINT;
}


/*doc*/
/****************************************************************************
** Setup function to be called by mouse interrupt (** NEAR model only **)  **
**									   **
** mflag contains the following bit pattern				   **
**									   **
** BIT	 CALL SUBROUTINE ON						   **
**  0	 CURSOR POSN CHANGED						   **
**  1	 LEFT BUTTON PRESSED						   **
**  2	 LEFT BUTTON RELEASED						   **
**  3	 RIGHT BUTTON PRESSED						   **
**  4	 RIGHT BUTTON RELEASED						   **
**  5-15 NOT USED							   **
**									   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_subroutine(int mflag,void far *func)
{
_CX = mflag;		    /* bit pattern to call subroutine */
_ES = FP_SEG(func);
_DX = FP_OFF(func);	    /* ES:DX -> function to call with mask */
_AX = 12;
MINT;
}


/*doc*/
/****************************************************************************
** Set mickey to pixel ratio. Default ratio is 8 mickeys to 8 pixels for   **
** columns and 16 mickeys to 8 pixels for rows.				   **
** ratcol = ratio for columns (8/8 = 1)					   **
** ratrow = ratio for rows (16/8 = 2)					   **
** This routine controls speed at which cursor moves per mouse movement.   **
**									   **
**									   **
****************************************************************************/
/*enddoc*/
/*header cpmouse.hh */
/*funct*/
void mouse_set_mickey_pixel_ratio(int ratrow,int ratcol)
{
_CX = ratcol;
_DX = ratrow;
_AX = 15;
MINT;
}

