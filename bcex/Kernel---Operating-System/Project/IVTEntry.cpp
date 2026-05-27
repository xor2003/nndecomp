#include "IVTEntry.h"
#include <DOS.H>

const int brojUlaza = 256;
IVTEntry** IVTEntry::interruptVectorTable = new IVTEntry*[brojUlaza];

IVTEntry::IVTEntry(int entryNumberr, pInterrupt function) {
	this->myEvent = 0;
	if(entryNumberr >=0 && entryNumberr < 256)
		this->entryNum = entryNumberr;
	this->newroutine = function;
#ifndef BCC_BLOCK_IGNORE
	this->oldroutine = getvect(entryNumberr);
	setvect(entryNumberr, newroutine);
#endif
	interruptVectorTable[entryNum] = this;
}

IVTEntry::~IVTEntry(){
	if(this->myEvent == 0){
#ifndef BCC_BLOCK_IGNORE
		setvect(entryNum, oldroutine);
#endif
	}else{
		delete this->myEvent;
#ifndef BCC_BLOCK_IGNORE
		setvect(entryNum, oldroutine);
#endif
	}
	interruptVectorTable[entryNum] = 0;
}

void IVTEntry::oldRoutineCaller() {
	oldroutine();
}

void IVTEntry::signalMyEvent() {
	if(this->myEvent == 0){
		return;
	}else{
		this->myEvent->signal();
	}
}
