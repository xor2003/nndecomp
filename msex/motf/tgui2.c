/* Test GUI specific tools */
#include <graph.h>
#include <string.h>
#include "mouse.h"
#include "motfsm.h"
#include "motfad.h"

main()
{
   init_gui();

   FileSelectionDialog( 10, 10, "Open", "d:\\c\\source\\", "", 80 );
   getch();

   end_gui();
}
