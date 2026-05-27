#include "KerEven.h"
#include "System.h"

KernelEv::KernelEv(IVTNo entryNumberr) {
	lock();
	this->val = 1;
	this->entryNumber = entryNumberr;
	this->holder = ((PCB*)System::running)->getMyThread(); // Vlasnik dogadjaja je tekuca nit
	IVTEntry::interruptVectorTable[entryNumberr]->myEvent = this;
	unlock();
}

KernelEv::~KernelEv() {
	lock();
	IVTEntry::interruptVectorTable[entryNumber]->myEvent = 0;
	this->holder = 0;
	unlock();
}

void KernelEv::signal(){
	lock();
	if(this->holder == 0){ //Ako ne postoji onaj ko drzi(ko je vlasnik) dogadjaja, samo postavi vrednost na 1, ne inkrementiraj da vrednost ne bi bila veca od 1, jer je val binarno 0 ili 1
		this->val = 1;
	}else{ // Signaliziraj vlasniku da je spreman, stavi ga u red spremnih niti i otkaci ga od dogadjaja
		this->holder->myPCB->setSTATUS(1);
		Scheduler::put((PCB*)this->holder->myPCB);
		this->holder = 0;
	}
	unlock();
}

void KernelEv::wait() {
	lock();
	if(System::running->getMyThread() != this->holder){ // Ukoliko tekuca nit nije ona koja drzi ovaj dogadjaj, onda wait nema apsolutno nikakav efekat
		unlock();
		return;
	}else{
		if(this->val == 0){ //Ako je vec smanjena vrednost na 0, zablokiraj se i zatrazi dispatch
			this->holder->myPCB->setSTATUS(2);
			unlock();
			dispatch();
		}else if(this->val == 1){ // Ako je 1, samo smanji vrednost na 0
			this->val = 0;
		}
		unlock();
	}
}
