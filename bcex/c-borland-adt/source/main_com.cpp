#include <c:\student\borland\proyects\complejo.cpp>

void main(){
	Complejo a(2.5,6.8), b, c(a) ,d(23.3,6.4);
	cout << a;
	cout << b;
	cout << c;
	cout << d;

	Complejo e(a + b);
	Complejo f(c - b);

   cout << a;
	cout << b;
	cout << c;
	cout << d;


}