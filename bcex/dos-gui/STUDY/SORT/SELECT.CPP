#include "SELECT.H"

void selection_sort(int x[], int size) {
	int i, j;

	for (i = 0; i < size - 1; i++) {
		int min = i;

		for (j = i + 1; j < size; j++) {
			if (x[j] < x[min]) {
				min = j;
			}
		}

		if (min != i) {
			int temp = x[i];
			x[i] = x[min];
			x[min] = temp;
		}
	}
}
