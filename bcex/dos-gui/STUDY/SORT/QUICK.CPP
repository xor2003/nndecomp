#include "quick.h"

void quick_sort(int x[], int ini, int fim);

void quick_sort(int x[], int size) {
	quick_sort(x, 0, size - 1);
}

void quick_sort(int x[], int ini, int fim) {
  int i, j, pivo, aux;

  i = ini;
  j = fim;
  pivo = x[(i + fim) / 2];

  while(i <= j) {
    while(x[i] < pivo) {
      i++;
    }
    while(x[j] > pivo) {
      j--;
    }

    if (i <= j) {
      aux = x[i];
      x[i] = x[j];
			x[j] = aux;

      i++;
      j--;
    }
  }

  if (ini < j) {
    quick_sort(x, ini, j);
  }
  if (i < fim) {
    quick_sort(x, i, fim);
	}
}
