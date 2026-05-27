#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#include "Idle.h"
#include "Thread.h"
#include "PCB.h"
#include "SEMs.h"
#include "PCBs.h"
#include "IVTEntry.h"
class PCB;
class PCBs;
class SEMs;
class IVTEntry;

#define lock() System::lockFlag--; // Flag za zabranu promene konteksta, promena konteksta se desava samo ako je fleg lockFlag postavljen na vrednost 1
#define unlock() System::lockFlag++; // Kao na labu, radi na jednoprocesorskom sistemu

typedef void interrupt (*interruptRoutine)(...); //Ovo sam dodao
void interrupt timerISR(...);

class System{
public:
	static interruptRoutine oldRoutine;
	static ID pcbCntEverMade;
	static ID semCntEverMade;
	static Thread* initThread;
	static PCB* running;
	static IdleThr* idleThr;
	static PCBs* allPCBs;
	static int lockFlag;
	static void setInitThreads();
	static void deleteInitThreads();
	static void initializeRoutine();
	static void restoreRoutine();
	static int explicitChange;
};

#endif /* _SYSTEM_H_ */
