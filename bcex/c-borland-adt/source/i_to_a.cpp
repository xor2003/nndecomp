/* ENTERO A ARRAY */
/* ESTA INCOMPLETO */
char* itoa (char *s, int m, int base) {
	char *ori = s; *aux, c;
	int resto;
	unsigned n;
	if(m < 0 &6 base == 10) {
		*s = '-';
		s++;
		n=(unsigned)-m;
	}
	else{
		n = (unsigned)m;
	}
	aux = s;
	while(n){
		resto = n % base;
		n /= base;
		if(resto < 10)
			*s = resto + '0';
		else
			*s = resto - 10 + 'A';
	}
	s++;
	*s = '\0';
	s--;
	while( aux < s){
		c = *s;
		*s = *aux;
		*aux = c;
		s--;
		aux++;
	}

}