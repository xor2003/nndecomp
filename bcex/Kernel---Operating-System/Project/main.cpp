#include "System.h"
#include "STDIO.H"
#include <IOSTREAM.H>
#include "IVTEntry.h"

extern int userMain(int argc, char* argv[]);

int main (int argc, char* argv[]){
	System::setInitThreads();
	System::initializeRoutine();
	int retVal = userMain(argc, argv);
	System::restoreRoutine();
	System::deleteInitThreads();
	delete[] IVTEntry::interruptVectorTable;
	return retVal;
}
