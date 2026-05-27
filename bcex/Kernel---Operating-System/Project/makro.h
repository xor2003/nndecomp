/*
 * makro.h
 *
 *  Created on: Aug 7, 2021
 *      Author: OS1
 */

#ifndef _MAKRO_H_
#define _MAKRO_H_

#define PREPAREENTRY(Number,callOld)\
	void interrupt intrpt##Number(...);\
	IVTEntry newEntry##Number(Number, intrpt##Number);\
	void interrupt intrpt##Number(...){\
		newEntry##Number.signalMyEvent();\
		if(callOld==1)\
			newEntry##Number.oldRoutineCaller();\
		dispatch();\
	}\

#endif /* _MAKRO_H_ */
