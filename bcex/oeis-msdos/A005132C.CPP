//
// a005132.cpp
//
// Recaman sequence:  a(0) = 0; a(n) = a(n-1)-n if non-negative,
//                              and not already in sequence, else
//                              a(n) = a(n-1)+n
//
// OEIS a005132

#include <stdio.h>
#include <stdlib.h>

unsigned int * a;
unsigned int isinsequence(unsigned int, unsigned int);

int main() {
    unsigned int max = 2000;
    unsigned int n = 0;
    unsigned int a1, an;
    unsigned int seqlen = 0;

    a = (unsigned int*)malloc((max+1)*sizeof(unsigned int*));

    *(a + 0) = 0;
    seqlen = 1;

    for (n = 1; n < max; ++n) { 
        a1 =*(a + n - 1);
        an = a1  - n;
        if ((a1 < n) || (isinsequence(an, seqlen) == 1)) { 
            an = a1 + n;
        }
        *(a + n) = an;
        ++seqlen;

        printf("%u  %u\n", n, an);
    }

    free (a);
    return 0;
}

unsigned int isinsequence(unsigned int bn, unsigned int sl) {
    unsigned int found = 0;
    unsigned int i = 0;
    for (i = 0; i < sl; ++i) {
        if (bn == *(a + i)) {
            found = 1;
            break;
        }
    }
    return found;
}
