#include "c:\student\borland\source\string.cpp"
#include <iostream.h>

void main (){
   char letra[] = "Ricardo Perez Barbosa Duran";
	String uno(letra), dos("Hola, mundo"), tres(" a su servicio");

	cout << uno;
	cout << dos;
	cout << tres;
	cout << ((((dos+ " soy ") + uno) + tres)) << endl;

	String cuatro( dos );
   cout << cuatro;
}