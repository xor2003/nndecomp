
#ifndef _KEREVEN_H_
#define _KEREVEN_H_
#include "PCB.h"
#include "IVTEntry.h"

typedef unsigned char IVTNo;

class KernelEv{
public:
	KernelEv (IVTNo entryNumberr);
	~KernelEv();
	void wait();
	void signal();
private:
	Thread* holder; // Nit koja drzi(koja je vlasnik) ovog dogadjaja
	IVTNo entryNumber; // Broj ulaza u tabeli prekidnih rutina za koji se vezuje posmatrani dogadjaj
	int val; //Moze imati vrednost samo 0 ili 1 jer se dogadjajima realizuje koncept binarnih semafora
};

#endif /* _KEREVEN_H_ */
