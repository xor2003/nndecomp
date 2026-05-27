/* ESTO NO FUNCIONA. ESTA MAL COPIADO! */

#include <stdio.h>
#include <string.h>

void main(){
	int tam, cont = 0;
	char texto[] = {"Estaba la pajara pinta sentada en el verde lim\243n."};
	char *ppio, *pfin, *ppal;
	ppio = texto;

	while(*ppio == ' ' || *ppio == '\t')
		ppio++;

	//if(*ppio=='.')
	 //	return 0;
	pfin=ppio;
	while(*pfin!=' ' && *pfin!='.')
		pfin++;

	tam = (int)(pfin-ppio);
	printf("La 1º palabra es \"%*s\"\n",ppio);

	ppal = pfin;

	while(*ppal == ' '){
		ppal++;
	}

	pfin = ppal;
	while(*pfin!='.')
		pfin++;
	pfin -= tam;

	while(ppal < pfin) {
		if(!strrchr(&(ppio+ppal),tam) && *(ppal+tam)==' ' ||
			 *(ppal+tam)=='.' || *(ppal+tam)=='\t') {
				cont++;
				ppal += cont;
			 }
		else while(*ppal!=' ' && *ppal!='.') ppal++;

		while(*ppal!='.' && *ppal!=" ") ppal++;
	}



}
