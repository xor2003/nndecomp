
#ifndef _SEMS_H_
#define _SEMS_H_

#include "KerSem.h"

class KernelSem;

class SEMs{
private:
	struct ElemS{
		KernelSem* sem;
		ElemS* next;
		ElemS(KernelSem* semm){
			sem = semm;
			next = 0;
		}
	};
	ElemS* head;
	ElemS* tail;
	int size;
public:
	SEMs();
	~SEMs();
	void insertSEM(KernelSem* sem);
	void removeSEM(KernelSem* sem);
	int getSizeOfList();
	KernelSem* getSEMByID(int id);
	void updateSEMsTime();
};


#endif /* _SEMS_H_ */
