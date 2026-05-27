// File: thread.h
#ifndef _thread_h_
#define _thread_h_


typedef unsigned long StackSize;
const StackSize defaultStackSize = 4096;
typedef unsigned int Time; // time, x 55ms
const Time defaultTimeSlice = 2; // default = 2*55ms
typedef int ID;
class PCB; // Kernel's implementation of a user's thread

class Thread{
public:
	void start();
	void waitToComplete();
	virtual ~Thread();
	ID getId();
	static ID getRunningId();
	static Thread * getThreadById(ID id);
protected:
	friend class PCB;
	friend class System;
	Thread (StackSize stackSize = defaultStackSize, Time timeSlice =defaultTimeSlice);
	virtual void run() {}
private:
	friend class KernelEv;
	PCB* myPCB;
};

void dispatch ();

#endif
