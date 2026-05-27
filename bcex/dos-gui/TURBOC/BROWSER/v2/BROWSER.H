#ifndef BROWSER_H
#define BROWSER_H

#include "main.h"
#include "screen.h"
#include "buffer.h"

class Browser {
public:
	ScreenClass *ScrPtr;
	Buffer *MainBuff;
	Buffer *AltBuff;
	int Lc;
	int Bot;
	int End;

	Browser(ScreenClass *Scr, Buffer *Buf1, Buffer *Buf2);
	virtual ~Browser(void);

	void ProcessInput(char Ch);
	void DisplayFStat(void);
	void DisplayCommands(void);
	void SetLPtr(void);
	void ShowScreen(void);
	void PageUp(void);
	void PageDn(void);
	void LineUp(void);
	void LineDn(void);
	void TopPage(void);
	void BotPage(void);
	void FileSearch(void);
};

#endif
