#include <iostream.h>

class Complejo {
	private:
	float re;
	float ima;

	public:
		Complejo(float = 0, float = 0);
		Complejo(const Complejo&);
		~Complejo();
		Complejo& operator = (const Complejo&);
		Complejo operator + (const Complejo&) const;
		Complejo operator ++ (int);
		Complejo operator ++ ();
		Complejo operator - (const Complejo&) const;
		Complejo operator * (const Complejo&) const;
		//Complejo operator / (const Complejo&) const;
		friend Complejo operator + (const int, const Complejo&);
		friend ostream& operator << (ostream&, const Complejo&);
      friend istream& operator >> (istream&, Complejo&);
};