#include "bubble.h"

void bubble_sort(int x[], int size) {
	int troca;

	do {
		troca = 0;
		for (int i = 0; i < size - 1; i++) {
			if (x[i] > x[i+1]) {
	int t = x[i];
	x[i] = x[i+1];
	x[i+1] = t;
				troca = 1;
			}
		}
	} while(troca);
}
