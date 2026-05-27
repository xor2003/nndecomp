#if !defined(__IOSTREAM_H)
#include <iostream.h>
#endif

#if !defined(__STDIO_H)
#include <stdio.h>
#endif

#if !defined(__STDLIB_H)
#include <stdlib.h>
#endif

#if !defined(__CONIO_H)
#include <conio.h>
#endif

#if !defined(__CLASS_CPP)
#include "class.cpp"
#endif

int BANKER::alloc(void)
{
	resource = new int[no_of_resource];
	available = new int[no_of_resource];
	allocation = new int *[no_of_process];
	maximum = new int *[no_of_process];
	need = new int *[no_of_process];
	temp_alloc = new int *[no_of_process];
	complete = new int[no_of_process];

	for (int i = 0; i < no_of_process; i++)
	{
		allocation[i] = new int[no_of_resource];
		maximum[i] = new int[no_of_resource];
		need[i] = new int[no_of_resource];
		temp_alloc[i] = new int[no_of_resource];
	}

	if (resource == NULL || allocation == NULL || maximum == NULL || need == NULL || resource == NULL || temp_alloc == NULL || complete == NULL)
		return 0;
	else
		return 1;
}

int BANKER::dealloc(void)
{
	delete[] resource;
	delete[] available;

	for (int i = 0; i < no_of_process; i++)
	{
		delete[] allocation;
		delete[] maximum;
		delete[] need;
		delete[] temp_alloc;
	}

	delete allocation;
	delete maximum;
	delete need;
	delete temp_alloc;
	delete complete;

	if (resource == NULL && allocation == NULL && maximum == NULL && need == NULL && resource == NULL && temp_alloc == NULL && complete == NULL)
		return 0;
	else
		return 1;
}

int BANKER::validateDATA(int flag = 1)
{
	cout << "Validating Snapshot..." << endl;
	if (flag)
		cout << "( Note : If error found, promt will occur to correct the specific value. " << endl
			 << "         If entered data is not valid, maximum value is allocated.      )";

	int i, j;
	for (i = 0; i < no_of_resource; i++)
	{
		if (resource[i] < 0)
		{
			cout << endl;
			cout << "Error found..." << endl;
			cout << "Total resources cannot be negative." << endl;
			cout << endl
				 << endl
				 << "SnapShot of Resource allocation is invalid.";
			cout << endl
				 << "Press any key to exit...";
			getch();
			dealloc();
			exit(1);
		}
	}

	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			if (maximum[i][j] < 0)
			{
				cout << endl;
				cout << "Error found..." << endl;
				cout << "Maximum required resource cannot be negative." << endl;
				cout << endl
					 << endl
					 << "SnapShot of Resource allocation is invalid.";
				cout << endl
					 << "Press any key to exit...";
				getch();
				dealloc();
				exit(1);
			}
		}
	}

	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			if (allocation[i][j] > maximum[i][j] || allocation[i][j] < 0)
			{
				if (flag)
				{
					cout << endl;
					cout << "Error found..." << endl;
					cout << "Re-enter data for Process " << i << " : " << endl;
					cout << "Resource " << (char)(j + 65) << " : ";
					cin >> allocation[i][j];
					if (allocation[i][j] > maximum[i][j])
						allocation[i][j] = maximum[i][j];
				}
				else
				{
					return 0;
				}
			}
		}
	}
	cout << endl
		 << endl
		 << "SnapShot of Resource allocation is validated successfully.";
	return 1;
}

void BANKER::calcDATA(int flag = 1)
{
	int i, j;
	if (flag)
		cout << endl
			 << "Need matrix has been created.";
	for (i = 0; i < no_of_process; i++)
	{
		if (!complete[i])
			for (j = 0; j < no_of_resource; j++)
			{
				need[i][j] = maximum[i][j] - allocation[i][j];
			}
	}

	if (flag)
		cout << endl
			 << "Available instance of Resource has been calculated.";
	for (i = 0; i < no_of_resource; i++)
	{
		available[i] = resource[i];
	}
	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			if (!complete[i])
				available[j] -= allocation[i][j];
		}
	}
	return;
}

void BANKER::initDATA(int edit = 0)
{
	if (!edit)
	{
		cout << "Enter number of Process  : ";
		cin >> no_of_process;
		cout << "Enter number of Resource : ";
		cin >> no_of_resource;

		if (!alloc())
		{
			cout << "\n\n\n";
			cout << "Dynamic Memory Allocation Failed !!!" << endl;
			exit(1);
		}

		int i, j;
		cout << "\nEnter number of instance of Resource :" << endl;
		for (i = 0; i < no_of_resource; i++)
		{
			cout << "Resource " << (char)(i + 65) << " : ";
			cin >> resource[i];
		}
	}

	int i, j;
	cout << "\nEnter allocated instances of Resource for each Process :" << endl;
	for (i = 0; i < no_of_process; i++)
	{
		cout << "Process " << i << " : " << endl;
		for (j = 0; j < no_of_resource; j++)
		{
			cout << "Resource " << (char)(j + 65) << " : ";
			cin >> allocation[i][j];
		}
		cout << endl;
	}

	cout << "\nEnter maximum instances of Resource for each Process :" << endl;
	for (i = 0; i < no_of_process; i++)
	{
		cout << "Process " << i << " : " << endl;
		for (j = 0; j < no_of_resource; j++)
		{
			cout << "Resource " << (char)(j + 65) << " : ";
			cin >> maximum[i][j];
		}
		cout << endl;
	}

	for (i = 0; i < no_of_process; i++)
		complete[i] = 0;

	return;
}

void BANKER::save(void)
{
	int i, j;
	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			temp_alloc[i][j] = allocation[i][j];
		}
	}
	return;
}

void BANKER::restore(void)
{
	int i, j;
	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			allocation[i][j] = temp_alloc[i][j];
		}
	}
	calcDATA(0);
	return;
}

void BANKER::checkPRO(int pro = 99)
{
	int i, j, iCheck = 0;

	if (pro != 99 && pro != 999)
	{
		if (complete[pro])
			return;

		for (j = 0; j < no_of_resource; j++)
		{
			if (need[pro][j] == 0)
				iCheck++;
		}
		if (iCheck == no_of_resource)
		{
			cout << "Process " << pro << " has completed its execution." << endl;
			cout << "Process will release its occupied resources." << endl;
			for (j = 0; j < no_of_resource; j++)
				available[j] += maximum[pro][j];
			complete[pro] = 1;
		}
		return;
	}

	for (i = 0; i < no_of_process; i++)
	{
		if (complete[i])
		{
			cout << "Process " << i << " has already completed its execution." << endl;
			continue;
		}

		for (j = 0; j < no_of_resource; j++)
		{
			if (need[i][j] == 0)
				iCheck++;
		}
		if (iCheck == no_of_resource)
		{
			if (pro != 999)
			{
				cout << "Process " << i << " has completed its execution." << endl;
				cout << "Process will release its occupied resources." << endl;
			}
			for (j = 0; j < no_of_resource; j++)
				available[j] += maximum[i][j];
			complete[i] = 1;
		}
		iCheck = 0;
	}
	return;
}

void BANKER::snapshot(int first = 0)
{
	cout << "No. of Process  : " << no_of_process << endl;
	cout << "No. of Resource : " << no_of_resource << endl;

	int i, j;
	cout << "\nNo. of instance of each Resource before allocation :" << endl;
	for (i = 0; i < no_of_resource; i++)
		cout << " " << (char)(i + 65) << " : " << resource[i] << "\t";
	cout << endl
		 << endl;
	cout << "---------<<< Process Resource Allocation SnapShot >>>---------" << endl;
	if (no_of_resource < 3)
		cout << "                ALLOC\tMAX\tNEED" << endl;
	else
		cout << "                ALLOCATION\tMAXIMUM\t\tNEED" << endl;

	if (!first)
	{
		checkPRO(999);
		calcDATA(0);
	}

	cout << "                ";
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < no_of_resource; j++)
			cout << (char)(j + 65) << "   ";

		if (no_of_resource == 4)
			cout << "\b\b\b";
		if (no_of_resource != 2)
			cout << "\t";
	}
	cout << endl;
	for (i = 0; i < no_of_process; i++)
	{
		cout << "Process " << i << " :\t";

		for (j = 0; j < no_of_resource; j++)
			if (!complete[i])
				cout << allocation[i][j] << "   ";
			else
				cout << (char)240 << "   ";
		cout << "\b\b\b\t";
		for (j = 0; j < no_of_resource; j++)
			cout << maximum[i][j] << "   ";
		cout << "\b\b\b\t";
		for (j = 0; j < no_of_resource; j++)
			cout << need[i][j] << "   ";
		cout << endl;
	}
	cout << "--------------------------------------------------------------" << endl;
	cout << "\nNo. of instance of each Resource after allocation :" << endl;
	for (i = 0; i < no_of_resource; i++)
		cout << " " << (char)(i + 65) << " : " << available[i] << "\t";

	return;
}

int BANKER::isSAFESTATE(void)
{
step1:
	int *work = new int[no_of_resource];
	int *finish = new int[no_of_process];
	int i, j, k;
	checkPRO(999);
	calcDATA(0);
	for (i = 0; i < no_of_resource; i++)
		work[i] = available[i];
	for (i = 0; i < no_of_process; i++)
		if (complete[i])
			finish[i] = 1;
		else
			finish[i] = 0;

step2:
	int iCheck = 0;
	for (i = 0; i < no_of_process; i++)
	{
		if (finish[i] == 1)
			continue;
		for (j = 0; j < no_of_resource; j++)
		{
			if (need[i][j] > work[j])
				iCheck = 1;
		}
		if (!iCheck && !finish[i])
			finish[i] = 9;
		iCheck = 0;
	}
	for (i = 0; i < no_of_process; i++)
	{
		if (finish[i] == 9)
			goto step3;
	}
	goto step4;

step3:
	for (i = 0; i < no_of_process; i++)
	{
		if (finish[i] == 9)
		{
			for (j = 0; j < no_of_resource; j++)
				work[j] += allocation[i][j];
			finish[i] = 1;
		}
	}
	goto step2;

step4:
	for (i = 0; i < no_of_process; i++)
	{
		if (finish[i] != 1)
		{
			delete finish;
			delete work;
			return 0;
		}
	}
	delete finish;
	delete work;
	return 1;
}

void BANKER::grantREQ(int reqPRO, int *request)
{
	restore();
	for (int i = 0; i < no_of_resource; i++)
	{
		allocation[reqPRO][i] += request[i];
	}
	calcDATA(0);
	save();
	return;
}

int BANKER::requestRES(void)
{
	save();
	int *request = new int[no_of_resource];
	int reqPRO;
	int i, j;
	cout << endl;
	cout << "Available Process : " << no_of_process << endl;
	cout << "For which process you want to request resource ? ";
	cin >> reqPRO;

	if (reqPRO >= no_of_process)
	{
		cout << endl;
		cout << "Request Denied !!!" << endl;
		cout << "Process " << reqPRO << " is not available into memory.";
		cout << endl;
		delete request;
		return 9;
	}

	if (complete[reqPRO])
	{
		cout << endl;
		cout << "Request Denied !!!" << endl;
		cout << "Process " << reqPRO << " has already completed so it cannot request resource.";
		cout << endl;
		delete request;
		return 9;
	}

	cout << endl;
	for (i = 0; i < no_of_resource; i++)
	{
		cout << "Request for Resource " << (char)(i + 65) << " : ";
		cin >> request[i];
	}

	for (j = 0; j < no_of_resource; j++)
	{
		if (request[j] > need[reqPRO][j])
		{
			cout << endl;
			cout << "Request Denied !!!" << endl;
			cout << "Process " << reqPRO << " has demanded resources more than its need.";
			cout << endl;
			delete request;
			return 9;
		}
	}

	for (j = 0; j < no_of_resource; j++)
	{
		if (request[j] > available[j])
		{
			cout << endl;
			cout << "Request Denied !!!" << endl;
			cout << "Process " << reqPRO << " needs resources more than available resources.";
			cout << endl;
			delete request;
			return 9;
		}
	}

	for (j = 0; j < no_of_resource; j++)
	{
		available[j] -= request[j];
		allocation[reqPRO][j] += request[j];
	}

	if (isSAFESTATE())
	{
		cout << "Process SnapShot is in SafeState." << endl;
		cout << "Request granted." << endl;
		grantREQ(reqPRO, request);
		checkPRO(reqPRO);
		delete request;
		return 1;
	}
	else
	{
		cout << "Process SnapShot is in unSafeState." << endl;
		cout << "Request denied !!!" << endl;
		restore();
		delete request;
		return 0;
	}
}

void BANKER::findSAFESEQ(void)
{
	if (!isSAFESTATE())
	{
		cout << "\nSnapShot is in UnSafeState." << endl;
		cout << "\nSafeSequence cannot be found." << endl;
		return;
	}

	save();
	cout << "\nSnapShot is in SafeState." << endl;
	cout << "\nThe SafeSequence for executing the Process :" << endl;
	int *check = new int[no_of_process];
	int i, j, iCheck = 0;

	for (i = 0; i < no_of_process; i++)
		check[i] = 0;
repeat:
	for (i = 0; i < no_of_process; i++)
	{
		for (j = 0; j < no_of_resource; j++)
		{
			if (available[j] < need[i][j])
				iCheck = 1;
		}
		if (!iCheck && !check[i])
		{
			cout << "P" << i << " --> ";
			check[i] = 1;
			for (j = 0; j < no_of_resource; j++)
				available[j] += allocation[i][j];
		}
		iCheck = 0;
	}

	for (i = 0; i < no_of_process; i++)
		if (!check[i])
			goto repeat;

	cout << "\b\b\b\b\b     ";
	restore();
	delete check;
	return;
}

BANKER::BANKER(void)
{
	clrscr();

	initDATA();

	clrscr();

	validateDATA();

	cout << endl;

	calcDATA();

	cout << endl
		 << endl
		 << "Press any key to continue...";
	getch();

	clrscr();

	snapshot(1);

	cout << endl;

	findSAFESEQ();

	cout << endl
		 << endl
		 << "Press any key to continue...";
	getch();
}

BANKER::~BANKER(void)
{
	clrscr();
	if (dealloc())
		cout << endl
			 << "Memory successfully deallocated.";
	else
		cout << endl
			 << "Memory deallocation failed !!!";

	cout << endl
		 << endl
		 << "Press any key to exit...";
	getch();
}