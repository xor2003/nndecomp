
#include "Thread.h"
#include "PCB.h"
#include "SCHEDULE.H"
#include "System.h"
#include "PCBs.h"
#include <STDIO.H>
#include <IOSTREAM.H>

Thread::Thread (StackSize sS, Time tS){
	lock();
	//cout<<"U konstruktoru za nit."<<endl;
	this->myPCB = new PCB(this, sS, tS);
	System::allPCBs->insertPCB(this->myPCB);
	//cout<<"Izlazim iz konstruktora za nit."<<endl;
	unlock();
}

Thread::~Thread(){
	waitToComplete();
	lock();
	delete this->myPCB;
	unlock();
}

void Thread::start() {
	lock();
	if((this->myPCB == 0) || (this->myPCB->id < 0)){
		unlock();
		return;
	}else{
		Scheduler::put(this->myPCB);
		this->myPCB->setSTATUS(1); // 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
		unlock();
	}
}

ID Thread::getId(){
	return this->myPCB->getID();
}

ID Thread::getRunningId(){
	return System::running->getID();
}

Thread* Thread::getThreadById(ID id){
	if(id < 0)
		return 0;
	else{
		return System::allPCBs->findPCB(id)->getMyThread();
	}
}

void Thread::waitToComplete(){
	lock();
	//printf("U waitToComplete sam.\n");
	// 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
	if((System::running == 0) || (System::running != 0 && (System::running->id < 0 || (this->myPCB->statusFlag == 3 || this->myPCB->statusFlag == 0)))){
		unlock();
		return;
	}else{
		ID myID = this->myPCB->id;
		if((myID == System::running->id) || (this->myPCB->getSTATUS() == 4) || (this == System::initThread)){
			unlock();
			return;
		}else{
			// 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
			System::running->setSTATUS(2);
			PCB* pcb = (PCB*)System::running;
			this->myPCB->waitingOnMineCompletition->insertPCB(pcb);
			unlock();
			dispatch();
		}
	}
}

void dispatch (){
#ifndef BCC_BLOCK_IGNORE
	System::explicitChange = 1;
	timerISR(); // Moze i asm int 08h => zadaje se softverski prekid 08h, najviseg prioriteta
#endif
}

