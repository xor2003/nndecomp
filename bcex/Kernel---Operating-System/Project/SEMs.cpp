#include "SEMs.h"
#include "System.h"

SEMs::SEMs(){ // Metode za rad sa listom semafora, identicne kao metode za rad sa listom PCBova
	lock();
	this->head = 0;
	this->tail = 0;
	this->size = 0;
	unlock();
}

SEMs::~SEMs(){
	lock();
	ElemS* curr = (ElemS*)head;
	while(curr != 0){
		ElemS* forDelete = curr;
		curr = curr->next;
		forDelete->next = 0;
		delete forDelete;
	}
	this->head = 0;
	this->tail = 0;
	this->size = 0;
	unlock();
}

void SEMs::insertSEM(KernelSem* sem){
	lock();
	ID id = sem->semID;
	KernelSem* found = getSEMByID(id);
	if(found == 0){
		ElemS* forInsert = new ElemS(sem);
		if(this->head == 0){
			this->head = this->tail = forInsert;
		}else{
			this->tail->next = forInsert;
			this->tail = forInsert;
		}
		this->size++;
	}
	unlock();
}

void SEMs::removeSEM(KernelSem* sem){
	lock();
	ID id = sem->semID;
	KernelSem* found = getSEMByID(id);
	if(found == 0){
		unlock();
		return;
	}else{
		ElemS* prev = 0;
		ElemS* curr = (ElemS*)head;
		while(curr->sem->semID != id){
			prev = curr;
			curr = curr->next;
		}
		if(prev == 0){
			this->head = this->head->next;
			if(this->head == 0)
				this->tail = 0;
		}else{
			if(curr == this->tail)
				this->tail = prev;
			prev->next = curr->next;
			curr->next = 0;
		}
		delete curr;
		this->size--;
		unlock();
		return;
	}
}

KernelSem* SEMs::getSEMByID(ID id){
	KernelSem* found = 0;
	lock();
	ElemS* curr = (ElemS*)head;
	while((curr != 0) && (curr->sem->semID != id))
		curr = curr->next;
	if(curr != 0)
		found = curr->sem;
	unlock();
	return found;
}

void SEMs::updateSEMsTime(){
	lock();
	for(ElemS* curr = (ElemS*)head; curr != 0; curr = curr->next){
		int toIncrease = 0;
		if(curr->sem->blocked->size > 0 && curr->sem->blockedWithGivenTimer > 0){
			toIncrease = curr->sem->blocked->checkPCBsTime();
			curr->sem->value += toIncrease;
		}
	}
	unlock();
}

int SEMs::getSizeOfList(){
	return this->size;
}
