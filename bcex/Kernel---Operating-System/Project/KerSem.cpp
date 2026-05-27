
#include "KerSem.h"
#include "System.h"

SEMs* KernelSem::allSemaphores = new SEMs();

 KernelSem::KernelSem (int init) {
	 lock();
	 this->value = init;
	 this->semID = System::semCntEverMade++;
	 this->blocked = new PCBs();
	 this->blockedWithGivenTimer = 0; // Na pocetku nema niti koje cekaju, ni na istek odredjenog timeStampa, ni na neodredjeno
	 this->blockedWithoutGivenTimer = 0;
	 unlock();
}

 KernelSem::~KernelSem (){
	 lock();
	 KernelSem::allSemaphores->removeSEM(this);
	 delete this->blocked;
	 unlock();
}

int KernelSem::val()const{
 	 return this->value;
}

int KernelSem::wait(Time maxTimeToWait){
	lock();
	this->value--;
	if(this->value<0){
		System::running->elapsedTime = 0;
		System::running->timeToWait = maxTimeToWait;
		System::running->checkTimeBlocked = (maxTimeToWait == 0)? 0:1;
		System::running->setSTATUS(2); //Block running thread because there isn't enough tocens on this semaphore
		this->blocked->insertPCB((PCB*)System::running);
		if(maxTimeToWait == 0)
			this->blockedWithoutGivenTimer++;
		else
			this->blockedWithGivenTimer++;
		unlock();
		dispatch();
	}else{
		unlock();
		return 1;
	}
}

void KernelSem::signal(){
	lock();
	if(value<0){
		if(blocked->head != 0){
			PCB* found;
			if(this->blockedWithGivenTimer > 0 || this->blockedWithoutGivenTimer > 0){//U slucaju da postoje oba tzv. tipa cekajucih niti, prednost dajem onima sa neodredjenim vremenom cekanja
				if(this->blockedWithoutGivenTimer > 0){
						found = this->blocked->getAndRemoveFirstWithoutGivenTimer();
						this->blockedWithoutGivenTimer--;
				}
				else if(this->blockedWithGivenTimer > 0){
						found = this->blocked->getAndRemoveFirstWithGivenTimer();
						this->blockedWithGivenTimer--;
				}
			}
			found->setSTATUS(1); // Oznaci nit kao spremnu za izvrsavanje i stavi je u red spremnih niti pomocu Schedulera, pa ce nekad doci ponovo red na nju da se izvrsava.
			Scheduler::put((PCB*)found);
		}
	}
	this->value = this->value + 1;
	unlock();
}
