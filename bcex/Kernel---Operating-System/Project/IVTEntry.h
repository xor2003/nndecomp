#ifndef _IVTENTRY_H_
#define _IVTENTRY_H_

#include "Event.h"

typedef void interrupt (*pInterrupt) (...);

class KernelEv;

class IVTEntry {
public:
	static IVTEntry** interruptVectorTable;
	IVTEntry (int entryNumber,pInterrupt function);
	~IVTEntry();
	void oldRoutineCaller();
	void signalMyEvent();
	KernelEv* myEvent;
private:
	int entryNum;
	pInterrupt oldroutine;
	pInterrupt newroutine;
};

#endif /* _IVTENTRY_H_ */
