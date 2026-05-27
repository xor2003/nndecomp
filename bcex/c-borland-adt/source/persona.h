
class Persona {
	private:
   	char *apeynom;
		unsigned long int dni;
		char sexo;
		char direccion[35];

	public:
		Persona ();
      Persona (char*, const unsigned long int, char, char[]);
      ~Persona();
      void mostrar();
      friend char* str_dup_new(const char*);
};
