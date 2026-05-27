#include "Event.h"
#include "System.h"

Event::Event(IVTNo ivtNo) {
	lock();
	this->myImpl = new KernelEv(ivtNo);
	unlock();
}

Event::~Event(){
	delete this->myImpl;
}

void Event::signal(){ // Samo poziv metode koja je nevidljiva(nedostupna) za korisnika
	this->myImpl->signal();
}

void Event::wait() { // Samo poziv metode koaj je nevidljiva(nedostupna) za korisnika
	this->myImpl->wait();
}
