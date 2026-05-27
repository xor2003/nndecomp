#ifndef _PCB_H_
#define _PCB_H_

#include "SCHEDULE.H"
#include "PCBs.h"
#include "Thread.h"
#include "KerSem.h"

class PCBs;

class PCB{
public:
	PCB(Thread* myThread, StackSize stackSize = defaultStackSize, Time timeSlice = defaultTimeSlice);
	~PCB();

	static void bodyWrapper();
	void makeStack(void (*wrapper)());
	void setSTATUS(int newStatus);
	int getSTATUS();
	Thread* getMyThread();
	StackSize getStackSize();
	Time getTimeSlice();
	ID getID();

	PCBs *waitingOnMineCompletition; //Blokirane niti koje cekaju na moj zavrsetak

	ID id;
	volatile int statusFlag; // 0 - Newly, 1 - Ready for Executing, 2 - Blocked or suspendedm 3 - Finished, 4 - Idle, 5 - Running thread
	static int cnt;
	int nonLimited; //Ako se kao parametar timeSlice konstruktoru prosledi 0, imace vrednost 1
	int notFinished; //Sve dok ne istekne dodeljeni timeSlice, ima vrednost 1

	unsigned SP, SS, BP; //stackPointer, stackSegment, basePointer

	//Pomocni podaci za rad sa semaforima
	int checkTimeBlocked; //Niti na semaforu mogu biti blokirane na 2 nacina: na odredjeno vreme kada je ovo polje 1, i na neodredjeno vreme kada je ovo polje 0
	int timeHasPassed(); //Vraca 1 ako je proteklo vreme kako je nit blokirana jednako dodeljenom vremenu cekanja na posmatranom semaforu
	volatile int timeToWait; // Bice razlicito od nule kada je waitingNotLimited = 0. Vreme koje nit treba da saceka zablokirana na odredjenom semaforu.
	volatile int elapsedTime; // Proteklo vreme kako je nit zablokirana na odredjenom vremenu. Uzima vrednosti od 0 do timeToWait.
private:
	Thread* myThread;
	StackSize stackSize;
	Time timeSlice;
	unsigned* stack;
};

#endif /* _PCB_H_ */
