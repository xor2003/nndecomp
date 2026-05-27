
#ifndef _KERSEM_H_
#define _KERSEM_H_
#include "PCBs.h"
#include "SEMs.h"
#include "Semaphor.h"

class SEMs;
class PCBs;

class KernelSem {

public:
	static SEMs* allSemaphores; // Svi semafori u sistemu, implementacija liste u klasi SEMs
	int semID;
	KernelSem(int init=1);
	~KernelSem();
	int wait (Time maxTimeToWait);
	void signal();
	int val()const;
private:
	friend class SEMs;
	int value;
	PCBs* blocked;
	int blockedWithGivenTimer; //Broj niti koje su zablokirane na odredjeni vremenski period
	int blockedWithoutGivenTimer; //Broj niti koje su zablokirane na neodredjeni vremenski period, zbir ovih dveju promenljivih mora da bude jednak duzini(size) od blocked
};

#endif  _KERSEM_H_
