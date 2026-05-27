//-------------------------------------------------------------------
//
// a001043c.cpp
//
// Numbers that are the sum of 2 successive primes
//
// OEIS a001043
//
//-------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {

    int max = 1000;
    int sqm = (int)sqrt(max) + 1;

    int* primes = (int *)malloc(max * sizeof(int));
    int* sieve = (int *)malloc(max * sizeof(int));
    int* sums = (int *)malloc((max+2) * sizeof(int));

    int i = 0;
    int sp = 2;     // a pointer to the next prime in the array
    int pcount = 0;

    for (i = 0; i < max; ++i) {
        *(sieve + i) = 1;
    }

    *(sieve + 0) = 0;
    *(sieve + 1) = 0;

    for (sp = 2; sp <= sqm; ++sp) {
        if (*(sieve + sp) != 0) {
            int sc = sp + sp;
            for (sc = sp+sp; sc < max; sc = sc + sp) {
                *(sieve + sc) = 0;
            }
        }
    }            

    for (i = 0; i < max; ++i) {
        if (*(sieve + i) == 1) {
            *(primes + pcount) = i;
            ++pcount;
        }
    }
    
    for (i = 0; i < (pcount-1); ++i) {
        *(sums + i) = *(primes + i) + *(primes + i + 1);
    }

    for (i = 0; i < (pcount-1); ++i) {
        printf("%d    %d\n", i + 1, *(sums + i));
    }

    free(sieve);
    free(primes);
    free(sums);
    return 0;
}
