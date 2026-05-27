#include "PCBs.h"
#include "System.h"
#include <STDIO.H>
#include <IOSTREAM.H>

PCBs::PCBs(){ //Radi
	lock();
	this->head = 0;
	this->tail = 0;
	this->size = 0;
	unlock();
}


PCBs::~PCBs(){ //Radi 
	lock();
	Elem* curr = (Elem*)head;
	while(curr != 0){
		Elem* forDelete = curr;
		curr = curr->next;
		forDelete->next = 0;
		delete forDelete;
	}
	this->head = 0;
	this->tail = 0;
	this->size = 0;
	unlock();
}

PCB* PCBs::findPCB(ID id){ //Radi 
	PCB* found = 0;
	lock();
	Elem* curr = (Elem*)head;
	while((curr != 0) && (curr->pcb->id != id))
		curr = curr->next;
	if(curr != 0)
		found = curr->pcb;
	unlock();
	return found;
}

void PCBs::insertPCB(PCB* pcb){ //Radi
	lock();
	//cout<<"Dodajem pcb u listu."<<endl;
	ID id = pcb->id;
	PCB* found = findPCB(id);
	if(found == 0){
		Elem* forInsert = new Elem(pcb);
		if(this->head == 0){
			this->head = this->tail = forInsert;
		}else{
			this->tail->next = forInsert;
			this->tail = forInsert;
		}
		this->size++;
	}
	//cout<<"Dodao sam PCB u listu."<<endl;
	unlock();
}

void PCBs::removePCB(PCB* pcb){ //Radi
	lock();
	ID id = pcb->id;
	PCB* found = findPCB(id);
	if(found == 0){
		unlock();
		return;
	}else{
		Elem* prev = 0;
		Elem* curr = (Elem*)head;
		while(curr->pcb->id != id){
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

PCB* PCBs::getAndRemoveFirst(){ //Radi
	PCB* found;
	Elem* old;
	lock();
	if(this->head != 0) {
		old = this->head;
		this->head = this->head->next;
		if(this->head == 0){
			this->head->next = 0;
			this->tail = 0;
		}
		found = old->pcb;
		delete old;
		this->size--;
	}else{
		found = 0;
	}
	unlock();
	return found;
}

PCB* PCBs::getAndRemoveFirstWithoutGivenTimer(){ //Sve niti koje cekaju na semaforu su zablokirane i cekaju u istom redu cekanja. Mesaju se one koje cekaju dok ne istekne odredjeno vreme i one druge.
	PCB* found;
	Elem* curr;
	Elem* prev;
	lock();
	if(this->head != 0){
		prev = 0;
		curr = this->head;
		while(curr->pcb->checkTimeBlocked != 0){
			prev = curr;
			curr = curr->next;
		}
		if(curr == 0){
			found = 0;
		}else{
			found = curr->pcb;
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
		}
	}else{
		found = 0;
	}
	unlock();
	return found;
}

PCB* PCBs::getAndRemoveFirstWithGivenTimer(){
	PCB* found;
	Elem* curr;
	Elem* prev;
	lock();
	if(this->head != 0){
		prev = 0;
		curr = this->head;
		while(curr->pcb->checkTimeBlocked != 1){
			prev = curr;
			curr = curr->next;
		}
		if(curr == 0){
			found = 0;
		}else{
			found = curr->pcb;
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
		}
	}else{
		found = 0;
	}
	unlock();
	return found;
}

int PCBs::checkPCBsTime(){
	int retVal = 0;
	lock();
	Elem* first = (Elem*)head;
	do{
		if(first->pcb->checkTimeBlocked == 0){
			first = first->next;
		}else{
			PCB* forDelete = 0;
			first->pcb->elapsedTime++;
			if(first->pcb->timeHasPassed() == 0){ //Vreme koje nit trenutno ceka na semaforu nije isto kao dodeljeno vreme cekanja
				first = first->next;
			}else{ // Vreme koje nit trenutno ceka je identicno dodeljenom vremenu cekanja, nit je spremna da se odblokira sa datog semafora
				retVal++;
				first->pcb->setSTATUS(1); // Postaje Ready jer je proslo vreme blokiranja
				forDelete = first->pcb;
				Scheduler::put((PCB*)first->pcb);
				first = first->next;
				this->removePCB(forDelete);
			}
		}
	}while(first != 0);
	unlock();
	return retVal;
}

int PCBs::getSizeOfList(){
	return this->size;
}
