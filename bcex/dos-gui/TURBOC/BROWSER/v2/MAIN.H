#ifndef MAIN_H
#define MAIN_H

// Permite que vocˆ examine o conte£do de um arquivo no formato
// ASCII ou hexadecimal.

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <conio.h>
#include <io.h>
#include <dir.h>
#include <dos.h>

#define Screen (*ScreenPtr)

// Tamanho m ximo do arquivo de aproximadamente 64KB.
const long MaxBufSize = 65520L;
const int TabSize = 5;
const unsigned char EscKey = 27;
const unsigned char PgUp = 73;
const unsigned char PgDn = 81;
const unsigned char Home = 71;
const unsigned char EndKey = 79;
const unsigned char UpKey = 72;
const unsigned char DnKey = 80;
// Tecla de pesquisa.
const unsigned char Alt_S = 31;
// Tecla de mudan‡a de buffer.
const unsigned char F1Key = 59;
const unsigned char TabKey = 9;
// Retorno de carro.
const unsigned char CR = 10;

// Lˆ uma sequˆncia na posi‡Æo atual do cursor.
char *GetStr(char *Str);
// Converte um byte em dois d¡gitos hexadecimais.
char *ChToHex(char *Str, char Ch);

#endif
