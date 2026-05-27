/*-------------------------------------------------------------
*
* a000005c.cpp
* 
* number of divisors of n
* 
* OEIS a000005
*
*--------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

int main() {
    const int max = 50;
    int * a = (int*)malloc((max+1)*sizeof(int));

    int i = 0;

    for (i = 0; i < max; ++i) {
        int count = 0;
        int j = 0;
        int n = i + 1;

        for (j = 1; j <= n; ++j) {
            if ((n % j) == 0) {
                ++count;
            }
        }            

        *(a + i) = count;  
    }

    for (i = 0; i < max; ++i) {
        printf("%d    %d\n", i+1, *(a+i)); 
    }

    free(a);    
    return 0;
}

