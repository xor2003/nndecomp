#ifndef _PCBs_H_
#define _PCBs_H_

#include "PCB.h"
#include "Thread.h"

class PCBs{
private:
	friend class SEMs;
	struct Elem{
		PCB* pcb;
		Elem* next;
		Elem(PCB* pcbb){
			this->pcb = pcbb;
			this->next = 0;
		}
	};
public:
	PCBs();
	~PCBs();

	int getSizeOfList();
	PCB* findPCB(ID id);
	void insertPCB(PCB* pcb);
	void removePCB(PCB* pcb);
	PCB* getAndRemoveFirst();
	PCB* getAndRemoveFirstWithGivenTimer();
	PCB* getAndRemoveFirstWithoutGivenTimer();
	int checkPCBsTime();

	Elem* head;
	Elem* tail;
	int size;
};


#endif
