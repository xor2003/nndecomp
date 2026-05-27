#include "RAND.H"
#include <time.h>
#include <stdlib.h>

// Lehmer random number generator.

// Initial seed.
unsigned long rand_state = (unsigned long)time(0);

unsigned long lcg_parkmiller(unsigned long *state)
{
	const unsigned long a = 48271;

	unsigned long low = (*state & 0x7fff) * a;
	unsigned long high = (*state >> 15) * a;
	unsigned long x = low + ((high & 0xffff) << 15) + (high >> 16);

	x = (x & 0x7fffffff) + (x >> 31);
	return *state = x;
}

void lseed(unsigned long seed)
{
	rand_state = seed;
}

unsigned long lrand()
{
	return lcg_parkmiller(&rand_state);
}
