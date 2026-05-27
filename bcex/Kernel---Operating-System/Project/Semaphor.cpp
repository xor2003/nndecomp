
#include "Semaphor.h"
#include "KerSem.h"
#include "System.h"


Semaphore::Semaphore(int init){
	lock();
	this->myImpl = new KernelSem(init);
	KernelSem::allSemaphores->insertSEM(this->myImpl);
	unlock();
}

Semaphore::~Semaphore(){
	delete this->myImpl;
}

int Semaphore::wait(Time maxTimeToWait){ // Samo poziv metode koja je nevidljiva(nedostupna) korisniku
	int retVal = this->myImpl->wait(maxTimeToWait);
	return retVal;
}

void Semaphore::signal(){ // Samo poziv metode koja je nevidljiva(nedostupna) korisniku
	this->myImpl->signal();
}

int Semaphore::val()const{
	int retVal = this->myImpl->val();
	return retVal;
}
