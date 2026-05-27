/*-------------------------------------------------------------
*
* a001047c.cpp
* 
* a[n] = 3^n - 2^n
* 
* OEIS a001047
*
*--------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    const int max = 10;

    unsigned int * a = (unsigned int*)malloc((max+1)*sizeof(unsigned int));

    int i = 0;
    int n = 0;

    while (n < max) {
        *(a + n) = pow(3,n) - pow(2,n);
        ++n; 
    }

    for (i = 0; i < max; ++i) {
        printf("%u    %u\n", i+1, *(a+i)); 
    }

    free(a);    
    return 0;
}

