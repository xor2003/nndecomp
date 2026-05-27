/*
 * IDLE.h
 *
 *  Created on: Jul 25, 2021
 *      Author: OS1
 */

#ifndef _IDLE_H_
#define _IDLE_H_

#include "Thread.h"
class Thread;

class IdleThr:public Thread{
public:
	IdleThr():Thread(defaultStackSize,1){}
	void run(){
		int flag = 1;
		for(;;){
			if(flag == 1){
				flag = 1 - flag;
			}else{
				flag = 1;
			}
		}
	}
};

#endif /* _IDLE_H_ */
