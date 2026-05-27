/*-------------------------------------------------------------
*
* a000002c.cpp
* 
* The Kolakoski Sequence
* 
* OEIS a000002
*
*--------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

int main() {
    const int max = 50;
    int * a = (int*)malloc((max+1)*sizeof(int));

    int c = 1;                  // points to the length of the run
                                // about to be added            
                            
    int cc = 0;                 // points to the end of the current run             

    int i = 0;

    // seed the sequence
    
    *(a+0) = 1;

    while (cc < max) {
        int d = *(a + cc);
        int e = 2;
        if (d == 2) {           // if the current run is 2's, switch to 1's
            e = 1;
        }
        cc = cc + 1;
        *(a + cc) = e;
        
        if (*(a + c) == 2) {
            cc = cc + 1;
            *(a + cc) = e;
        }
        c = c + 1;
    }

    for (i = 0; i < max; ++i) {
        printf("%d    %d\n", i+1, *(a+i)); 
    }

    free(a);    
    return 0;
}

