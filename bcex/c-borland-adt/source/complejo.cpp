#include <c:\student\borland\proyects\complejo.h>

Complejo :: Complejo(float re, float ima){
	this->re = re;
	this->ima = ima;
}

Complejo :: Complejo(const Complejo& obj){
	this->re = obj.re;
	this->ima = obj.ima;
}

Complejo :: ~Complejo(){
}

 Complejo& Complejo :: operator = (const Complejo& obj){
	this->re = obj.re;
	this->ima = obj.ima;
	return *this;
}

 Complejo Complejo :: operator + (const Complejo& obj)const{
	return Complejo(this->re + obj.re, this->ima + obj.ima);
}

Complejo Complejo :: operator ++ (int){
	Complejo aux(*this);
	re++;
	return aux;
}

Complejo Complejo :: operator ++ (){
	re++;
	return *this;
}

Complejo Complejo :: operator - (const Complejo& obj) const{
	return Complejo(this->re - obj.re, this->ima - obj.ima);
}

Complejo Complejo :: operator * (const Complejo& obj) const{
	return Complejo(this->re * obj.re, this->ima * obj.ima);
}

/*Complejo Complejo :: operator / (const Complejo& obj) const{
}*/

Complejo operator + (const int a, const Complejo& obj){
	return Complejo(a + obj.re, obj.ima);
}

ostream& operator << (ostream& sal, const Complejo& obj){
	sal << "(" << obj.re << ", " << obj.ima << ")" <<endl;
	return sal;
}

istream& operator >> (istream& en, Complejo& obj){
	en >> obj.re;
	en >> obj.ima;
	return en;
}
