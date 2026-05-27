#ifndef HEXBUF_H
#define HEXBUF_H

#include "buffer.h"

class HexBuffer : public Buffer {
public:
	HexBuffer(void);
	virtual char *GetLine(char *Str, int Index);
	virtual void SetLines(void);
};

#endif
