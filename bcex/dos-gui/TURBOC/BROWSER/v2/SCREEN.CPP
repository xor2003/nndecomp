#include "screen.h"

ScreenClass::ScreenClass(unsigned Segment, unsigned Offset)
{
	ScreenPtr = (ScreenArea *)(((long)Segment << 16) | (long)Offset);
	ScrSize = 23;
}

ScreenClass::~ScreenClass(void)
{
}

char ScreenClass::Get(int X, int Y)
{
	return Screen[X][Y].Ch;
}

void ScreenClass::Put(int X, int Y, char Ch, unsigned char Attr)
{
	Screen[Y][X].Ch = Ch;
	Screen[Y][X].Attr = Attr;
}

void ScreenClass::MarkLine(int Row, unsigned char Attr)
{
	int Col;

	for (Col = 0; Col < 80; Col++) {
		Screen[Row][Col].Attr = Attr;
	}
}
