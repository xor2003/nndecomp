#include <iostream.h>
#include <string.h>
#include <c:\student\borland\proyects\persona.h>

Persona:: Persona() {
	this->apeynom = str_dup_new("Nombre y apellido");
	this->dni = 0L;
	this->sexo = 'U';
	strcpy(this->direccion,"Introduzca la direccion");
}

Persona:: Persona(char *ayn, unsigned long int dni, char sexo, char dir[]) {
	this->apeynom = str_dup_new(ayn);
	this->dni = dni;
	this->sexo = sexo;
	strcpy( this->direccion, dir);
}

Persona:: ~Persona() {
}

void Persona:: mostrar (){
	cout<<"\nNombre: "<< this->apeynom <<"\nDNI: "<< this->dni <<"\nSexo: "
		 << this->sexo <<"\nDireccion: "<< this->direccion <<"\n" ;
}

char* str_dup_new(const char *s){
	if(s && *s){
		char *aux = new char[strlen(s)+1];
		if(aux)
			strcpy(aux,s);
		return aux;
	}
	else
		return NULL;
}

