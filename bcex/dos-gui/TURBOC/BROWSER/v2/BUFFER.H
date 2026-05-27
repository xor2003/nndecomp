#ifndef BUFFER_H
#define BUFFER_H

#include "main.h"

class Buffer {
public:
	char *TextPtr;
	char FileName[13];
	unsigned char BuffAlloc;
	int NoBytes;
	int Attr;
	int NumLines;
	int LinePtr[2000];
	long Size;
	ftime Time;
	ffblk ffblk;
	FILE *fp;

	Buffer(void);
	virtual ~Buffer(void);
	unsigned char OpenAndRead(char *FName);

	// Duplica o buffer (apenas os apontamentos).
	void Dup(Buffer *Buf);

	// Recupera um caractere do buffer ou um Ctrl-Z (0x1A) caso esteja no final.
	char GetCh(int Index);
	virtual char *GetLine(char *Str, int Index);
	virtual void SetLines(void);
	int GetNumLines(void);
};

#endif
