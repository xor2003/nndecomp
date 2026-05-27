#include "System.h"
#include "SEMs.h"
#include "KerSem.h"
#include <STDIO.H>
#include "IVTEntry.h"
#include <IOSTREAM.H>
#include <DOS.H>

int System::lockFlag = 1;

ID System::pcbCntEverMade = 0;
ID System::semCntEverMade = 0;
IdleThr* System::idleThr = 0;
Thread* System::initThread = 0;
PCB* System::running = 0;
int runningId = 0;
PCBs* System::allPCBs = new PCBs();
int System::explicitChange = 0;
interruptRoutine System::oldRoutine = 0;

unsigned oldTimerSEG, oldTimerOFF;
unsigned tempSS, tempSP, tempBP;

extern void tick();

void System::setInitThreads(){
	lock();
	System::initThread = new Thread(defaultStackSize, 1);
	// 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
	System::allPCBs->findPCB(System::initThread->getId())->setSTATUS(1);
	System::running = System::allPCBs->findPCB(System::initThread->getId());
	System::idleThr = new IdleThr();
	System::allPCBs->findPCB(System::idleThr->getId())->setSTATUS(4);
}

void System::deleteInitThreads(){
	delete System::idleThr;
	delete System::initThread;
	delete System::allPCBs;
	unlock();
}

void interrupt timerISR(...){
	if(System::explicitChange == 0){
		PCB::cnt--;
#ifndef BCC_BLOCK_IGNORE
		asm int 60h;
#endif
		tick();
		KernelSem::allSemaphores->updateSEMsTime();
		int flag = System::running->nonLimited;
		if(flag == 1) return;
		if(PCB::cnt > 0) return;
	}
	if(System::lockFlag <= 0){
		System::explicitChange = 1;
	}else{
		System::explicitChange = 0;
#ifndef BCC_BLOCK_IGNORE
		asm{
			mov tempSP, sp
			mov tempBP, bp
			mov tempSS, ss
		}
#endif
		(System::running)->SP = tempSP;
		(System::running)->BP = tempBP;
		(System::running)->SS = tempSS;

		runningId = System::running->id;
		// 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspended, 3 - Finished, 4 - Idle, 5 - Running thread
		if(System::running->getSTATUS() != 2){
			if(System::running->notFinished == 0 ){
				System::running->setSTATUS(3);
			}else{
				if((System::idleThr->getId() != runningId && (System::running)->getSTATUS() != 4) && (System::running)->getSTATUS() != 2){ // Ne smemo da stavimo idle tj. uzaludnu nit
					if((System::running)->getSTATUS()==1){
						Scheduler::put(((PCB*)System::running));
					}
				}
			}
		}
		System::running = (PCB*)(Scheduler::get());
		if(System::running == 0){
			System::running = System::allPCBs->findPCB(System::idleThr->getId());
		}
		tempSP = (System::running)->SP;
		tempBP = (System::running)->BP;
		tempSS = (System::running)->SS;
		PCB::cnt = System::running->getTimeSlice();
#ifndef BCC_BLOCK_IGNORE
		asm{
			mov sp, tempSP
			mov bp, tempBP
			mov ss, tempSS
		}
#endif
	}

 }


void System::initializeRoutine(){ //Radi
#ifndef BCC_BLOCK_IGNORE
	oldRoutine = getvect(0x08);
	setvect(0x08, timerISR);
	setvect(0x60, oldRoutine);
	unlock();
#endif
}

void System::restoreRoutine(){ //Radi
#ifndef BCC_BLOCK_IGNORE
	lock();
	oldRoutine = getvect(0x60);
	setvect(0x08, oldRoutine);
#endif
}
