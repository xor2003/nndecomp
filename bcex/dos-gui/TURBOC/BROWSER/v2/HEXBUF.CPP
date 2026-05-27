#include "hexbuf.h"

HexBuffer::HexBuffer(void) : Buffer()
{
}

char *HexBuffer::GetLine(char *Str, int Index)
{
	char S[3] = "  ";
	int I;

	strcpy(Str, "");
	for (I = 0; I < 16; I++) {
		strcat(Str, ChToHex(S, GetCh(Index + I)));
		strcat(Str, " ");
	}

	strcat(Str, "| ");
	for (I = 0; I < 16; I++) {
		Str[I + 50] = GetCh(Index + I);
	}

	Str[66] = '\0';
	return Str;
}

void HexBuffer::SetLines(void)
{
	int L;
	int I;

	NumLines = Size / 16;
	if (Size % 16 != 0) {
		NumLines++;
	}

	for (I = 0; I < NumLines; I++, L += 16) {
		LinePtr[I] = L;
	}
}
