#include "buffer.h"

Buffer::Buffer(void)
{
	// No in°cio n∆o h† buffer allocado.
	BuffAlloc = 0;
  strcpy(FileName, "");
}

Buffer::~Buffer(void)
{
	if (BuffAlloc) {
		free(TextPtr);
  }
}

int Buffer::GetNumLines(void)
{
	return NumLines;
}

char Buffer::GetCh(int Index)
{
	return (Index < NoBytes) ? TextPtr[Index] : 0x1A;
}

unsigned char Buffer::OpenAndRead(char *Fname)
{
	int DosError;

	DosError = findfirst(Fname, &ffblk, 0);
	if (DosError != 0) {
		printf("N∆o consegui achar o arquivo %s\n", Fname);
		return 0;
	}

	if ((fp = fopen(Fname, "r")) == NULL) {
		printf("O arquivo %s n∆o pode ser aberto\n", Fname);
		return 0;
	}
	// Aloca a mem¢ria para o buffer.
	if ((TextPtr = (char far *)malloc(ffblk.ff_fsize)) == NULL) {
		printf("Mem¢ria insuficiente\n");
		BuffAlloc = 0;
		return 0;
	}

	BuffAlloc = 1;
	getftime(fileno(fp), &Time);
	Size = ffblk.ff_fsize;
	if (Size >= MaxBufSize) {
		printf("Arquivo muito grande\n");
		fclose(fp);
		return 0;
	}

	NoBytes = read(fileno(fp), TextPtr, ffblk.ff_fsize);
	strcpy(FileName, Fname);
	fclose(fp);
	return 1;
}

void Buffer::Dup(Buffer *Buf)
{
	TextPtr = Buf->TextPtr;
	NoBytes = Buf->NoBytes;
	Size = Buf->Size;
	Time = Buf->Time;
	BuffAlloc = 0;
	SetLines();
}

char *Buffer::GetLine(char *Str, int Index)
{
	char Ch;
	int P = 0;
	int I;

	while((Ch = GetCh(Index)) != CR && Ch != 0x1A) {
		if (Ch == TabKey) {
			for (I = 0; I < TabSize; I++) {
				Str[P++] = ' ';
			}
		} else {
			Str[P++] = Ch;
		}

		Index++;
	}

	// Encerra a sequància.
	Str[P] = '\0';
	return Str;
}

void Buffer::SetLines(void)
{
	int L = 0;
	int I;

	// Inicia a matriz de °ndices.
	LinePtr[L++] = 0;
	for (I = 0; I < NoBytes; I++) {
		if (GetCh(I) == CR) {
			LinePtr[L++] = I + 1;
		}
	}

  NumLines = L;
}
