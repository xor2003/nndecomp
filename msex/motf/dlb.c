/* FileSelectionDialog test */

#include <stdio.h>
#include <string.h>
#include "motfsm.h"
#include "motfad.h"
#include "mouse.h"

main()
{
   char file[80], filt[80];

   strcpy( filt, "d:\\c\\samples\\*.*" );

   init_gui();

   FileSelectionDialog( 100, 100, "File", filt, file, 80 );

   end_gui();

   puts( file );
}
