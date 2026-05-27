#include "PCB.h"
#include "System.h"
#include <DOS.H>
#include <IOSTREAM.H>
#include <STDIO.H>

int PCB::cnt = 1;

PCB::PCB(Thread* myThr, StackSize sS, Time tS){
	//cout<<"U konstruktoru za nit."<<endl;
	this->myThread = myThr;
	this->id = System::pcbCntEverMade++;
	this->timeToWait = 0;
	this->elapsedTime = 0;
	this->checkTimeBlocked = 0;
	this->notFinished = 1;
	this->timeSlice = tS;
	this->nonLimited = (tS == 0)? 1:0;
	if(sS >= 65535 || sS < 0){
		this->stackSize = defaultStackSize/sizeof(unsigned);
	}
	else{
		this->stackSize = sS/sizeof(unsigned);
	}
	this->setSTATUS(0); // 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
	this->waitingOnMineCompletition = new PCBs();
	this->stack = new unsigned[this->stackSize];
	makeStack(PCB::bodyWrapper);
}

void PCB::makeStack(void (*wrapper)()){
	lock();
#ifndef BCC_BLOCK_IGNORE
	stack[stackSize - 1] = 0x200;
	stack[stackSize - 2 ] = FP_SEG(wrapper);
	stack[stackSize - 3 ] = FP_OFF(wrapper);
	this->SS = FP_SEG(stack + stackSize - 12);
	this->SP = FP_OFF(stack + stackSize - 12);
	this->BP = this->SP;
#endif
	//cout<<"Izlazim iz konstruktora za nit."<<endl;
	unlock();
}

PCB::~PCB(){
	delete [] this->stack;
	delete this->waitingOnMineCompletition;
}

ID PCB::getID(){
	return this->id;
}

Thread* PCB::getMyThread() {
	return this->myThread;
}

int PCB::timeHasPassed(){
	if(this->elapsedTime - this->timeToWait == 0){
		return 1;
	}else{
		return 0;
	}
}

void PCB::bodyWrapper (){
	System::running->myThread->run();
	lock();
	System::running->setSTATUS(3);
	System::running->notFinished = 0;
	PCBs* red = System::running->waitingOnMineCompletition;
	if(red->size != 0){
		PCB* first = red->getAndRemoveFirst();
		do{
			first->setSTATUS(1);
			Scheduler::put((PCB*)first);
			first = red->getAndRemoveFirst();
		}while(first != 0);
	}
	unlock();
	dispatch();
}

Time PCB::getTimeSlice(){
	return this->timeSlice;
}

StackSize PCB::getStackSize(){
	return this->stackSize;
}

void PCB::setSTATUS(int newStatus){
	this->statusFlag = newStatus;
}

int PCB::getSTATUS(){
	return this->statusFlag;
}
