/* Array to Integer  */
#include <stdio.h>
#include <c:\student\borland\source\str_len.cpp>

int a_to_i (const char *cad){
	int num = 0, i = 1;
	const char *j;
	j = (cad + str_len(cad))-1;

	while (j >= cad){
		if(*j >= '0' && *j <= '9')
			num += (*j - '0') * i;
			i *= 10;
			j--;
	}
	if(*cad == '-')
		num = num * (-1);
      return num;
}